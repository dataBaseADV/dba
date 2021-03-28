//
//  HomeViewController.swift
//  Netflix_Clone
//
//  Created by Shyngys Saktagan on 28.03.2021.
//  Copyright © 2020 YODA. All rights reserved.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {

    let viewModel: HomeViewModel
    
    let topNavbar = HomeTopNav()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection =  .vertical
        let collView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collView.showsVerticalScrollIndicator = false
        collView.contentInset = UIEdgeInsets(top: -42, left: 0, bottom: 0, right: 0)
        collView.noAutoConst()
        return collView
    }()
    
    let identifierOriginals = "netflixOriginal"
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupTopNavBarActions()
    }
    
    private func setupViews(){
        self.view.addSubview(collectionView)
        self.view.addSubview(topNavbar)

        collectionView.register(OriginalVideosCell.self, forCellWithReuseIdentifier: identifierOriginals)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        topNavbar.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(73)
        }
        
        collectionView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.top.equalTo(topNavbar.snp.bottom).offset(32)
        }
    }
    
    private func setupTopNavBarActions() {
        topNavbar.showContries = {
//            self?.navigationController?.pushViewController(SearchViewController(viewModel: SearchViewModel(model: self?.viewModel.movies ?? [], title: "Movies")), animated: true)
        }
    }
    
}

//MARK: - Collection View Functionality

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
        
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifierOriginals, for: indexPath) as! OriginalVideosCell
        switch indexPath.section {
            case 0:
                break
            case 1:
                cell.setSectionTitle("Movies")
                cell.setModel(model: viewModel.movies)
                cell.seeAll = { [weak self] models in
                    self?.navigationController?.pushViewController(SearchViewController(viewModel: SearchViewModel(model: self?.viewModel.movies ?? [], title: "Movies")), animated: true)
                }
            default:
                cell.setSectionTitle("TV Shows")
                cell.setModel(model: viewModel.tvShows)
                cell.seeAll = { [weak self] models in
                    self?.navigationController?.pushViewController(SearchViewController(viewModel: SearchViewModel(model: self?.viewModel.tvShows ?? [], title: "TV Shows")), animated: true)
                }
        }
        
        
        cell.showVideoDetails = { [weak self] model in
            self?.present(VideoDetailsViewController(viewModel: model), animated: true, completion: nil)
        }
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.size.width,
                      height: 200)
    }
}

//MARK: - CallBack Actions
extension HomeViewController {
//    fileprivate func onTapPlay() {
//        let appPlayer = AppPlayer()
//        self.present(appPlayer, animated: true, completion: nil)
//    }
}
