//
//  PreviewsCell.swift
//  Netflix_Clone
//
//  Created by Shyngys Saktagan on 28.03.2021.
//  Copyright © 2020 YODA. All rights reserved.
//

import UIKit
import SnapKit

typealias Callback<T> = (T) -> Void

class OriginalThumbCell: CollectionBaseCell {
        
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Hello"
        titleLabel.numberOfLines = .zero
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        titleLabel.font = .boldSystemFont(ofSize: 16)
        return titleLabel
    }()
    
    override func setupView() {
        self.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.3)
        self.layer.cornerRadius = 12
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.center.equalToSuperview()
        }
    }
    
    func setVideo(model: NetflixVideoModel) {
        titleLabel.text = model.title
    }
}

class OriginalVideosCell: CollectionBaseCell {
    
    var showVideoDetails: Callback<ViewDetailsViewModel>?
    var seeAll: Callback<[NetflixVideoModel]>?
    
    let lblTitle = Label(title: "Netflix Originals", .white, .appBoldFont(fSize: 18))
    let seeAllLabel = Label(title: "See All", .white, .appFont(fSize: 16), .left)
    
    var model = [NetflixVideoModel(show_id: "1", type: "Movie", title: "My Name Is Kozha", director: "Abdulla Karsakbayev", cast: ["Makil Kulanbayev", "Kenenbai Kozhabekov", "MORE"], coutry: "Kazakhstan", date_added: "2021", release_year: "1963", rating: "18+", duration: "85 min", listed_in: "1", description: "«Менің атым Қожа» — 1963 жылы \"Қазақфильм\" студиясы түсірген балалар фильмі. Режиссері — Абдолла Қарсақбаев. Сценариі Бердібек Соқпақбаевтың \"Менің атым Қожа\" повесінің желісімен жазылды.")]
        
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collView.noAutoConst()
        return collView
    }()
    
    let identifier = "thumbnailCell"
    
    override func setupView() {
        [lblTitle, seeAllLabel, collectionView].forEach { addSubview($0) }
        setupConstraints()
        setupCollectionViewDelegates()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(seeAllAction))
        seeAllLabel.isUserInteractionEnabled = true
        seeAllLabel.addGestureRecognizer(tap)
        self.collectionView.register(OriginalThumbCell.self, forCellWithReuseIdentifier: identifier)
    }
    
    private func setupConstraints() {
        lblTitle.snp.makeConstraints {
            $0.leading.top.equalToSuperview().inset(10)
            $0.height.equalTo(30)
        }
        
        seeAllLabel.snp.makeConstraints {
            $0.top.equalTo(lblTitle.snp.top)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(40)
        }
        
        collectionView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview().inset(16)
            $0.top.equalTo(lblTitle.snp.bottom).offset(20)
        }
    }
    
    private func setupCollectionViewDelegates() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    func setSectionTitle(_ text: String) {
        lblTitle.text = text
    }
    
    func setModel(model: [NetflixVideoModel]) {
        self.model = model
    }
    
    @objc func seeAllAction() {
        seeAll?(model)
    }
}

//MARK: - Collection View Functionality
extension OriginalVideosCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! OriginalThumbCell
        cell.setVideo(model: model[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        showVideoDetails?(ViewDetailsViewModel(model: model[indexPath.row]))
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 180, height: collectionView.frame.height)
    }
}
