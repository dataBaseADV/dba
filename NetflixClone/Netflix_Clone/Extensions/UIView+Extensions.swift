//
//  UIView+Extensions.swift
//  AkbarTravels
//
//  Created by Shyngys Saktagan on 28.03.2021.
//  Copyright © 2020 Akbar Travels. All rights reserved.
//

import UIKit

class View: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        noAutoConst()
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupViews() {}
}
