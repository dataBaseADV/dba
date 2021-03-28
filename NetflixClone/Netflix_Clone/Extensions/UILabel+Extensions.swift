//
//  UILabel+Extensions.swift
//  AkbarTravels
//
//  Created by Shyngys Saktagan on 28.03.2021.
//  Copyright © 2020 Akbar Travels. All rights reserved.
//

import UIKit

class Label: UILabel{
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            self.noAutoConst()
            self.lineBreakMode = .byWordWrapping
            self.numberOfLines = 0
       }
    
    init(title: String,
         _ color: UIColor = .black,
         _ font: UIFont = .appFont(fSize: 16),
         _ textAlignment: NSTextAlignment = .center) {
        super.init(frame: CGRect.zero)
        self.text = title
        self.textColor = color
        self.textAlignment = textAlignment
        self.noAutoConst()
        setupUI()
    }
       
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupUI() {
        self.lineBreakMode = .byWordWrapping
        self.numberOfLines = 0
        self.font = font
    }
}
