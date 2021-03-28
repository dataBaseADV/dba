//
//  SearchVideoCell.swift
//  Netflix_Clone
//
//  Created by Shyngys Saktagan on 28.03.2021.
//  Copyright © 2020 YODA. All rights reserved.
//

import UIKit

class SearchVideoCell: CollectionBaseCell {
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Hello"
        titleLabel.numberOfLines = .zero
        titleLabel.textColor = .white
        titleLabel.font = .boldSystemFont(ofSize: 16)
        return titleLabel
    }()
    
    private let imgMoreDetails = ImageView(image: #imageLiteral(resourceName: "play_white"))
    
    override func setupView() {
        self.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.3)
        self.addSubview(titleLabel)
        self.addSubview(imgMoreDetails)
        titleLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        imgMoreDetails.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-16)
            $0.size.equalTo(32)
            $0.centerY.equalToSuperview()
        }
    }
    
    func setVideo(model: NetflixVideoModel) {
        titleLabel.text = model.title
    }
}
