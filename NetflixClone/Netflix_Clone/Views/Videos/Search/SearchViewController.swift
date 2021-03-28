//
//  SearchViewController.swift
//  Netflix_Clone
//
//  Created by Shyngys Saktagan on 28.03.2021.
//  Copyright © 2020 YODA. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    let searchBar = SearchBarView()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection =  .vertical
        let collView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collView.showsVerticalScrollIndicator = false
        collView.noAutoConst()
        return collView
    }()
    
    let viewModel: SearchViewModel
    
    let identifier = "SearchVideoCell"
    
    init(viewModel: SearchViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.title
        setupViews()
        self.searchBar.txtSearch.becomeFirstResponder()
    }
    
    private func setupViews(){
        
        searchBar.backgroundColor = .rgba(r: 0, g: 0, b: 0, a: 0.5)
        [searchBar, collectionView].forEach { view.addSubview($0) }
                
        searchBar.onChangeText = { text in
            guard let text = text else {return}
            print(text)
        }
        
        collectionView.register(SearchVideoCell.self, forCellWithReuseIdentifier: identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        setupConstraints()
    }
    
    private func setupConstraints() {

        
        searchBar.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(8)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
            $0.height.equalTo(44)
        }
        
        collectionView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide).inset(16)
            $0.top.equalTo(searchBar.snp.bottom).offset(20)
        }
    }
}

//MARK: - Collection View Functionality
extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
        
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getModelCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! SearchVideoCell
        cell.setVideo(model: viewModel.getModel(at: indexPath.row))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model = viewModel.getModel(at: indexPath.row)
        self.present(VideoDetailsViewController(viewModel: ViewDetailsViewModel(model: model)), animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath:IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.size.width, height: 80)
    }
}
