//
//  CollectionBaseCell.swift
//  LoaderView
//
//  Created by Shyngys Saktagan on 28.03.2021.
//  Copyright © 2019 YODA. All rights reserved.
//

import UIKit

class CollectionBaseCell : UICollectionViewCell {
    
    let bgView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.rgba(r: 0, g: 0, b: 0, a: 0.2).cgColor
        view.layer.cornerRadius = 5
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupView() {}
}
