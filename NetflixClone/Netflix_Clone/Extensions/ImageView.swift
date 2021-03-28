//
//  File.swift
//  Netflix_Clone
//
//  Created by Shyngys Saktagan on 28.03.2021.
//  Copyright © 2020 YODA. All rights reserved.
//

import UIKit

class ImageView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
    }
    
    override init(image: UIImage?) {
        super.init(image: image)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupViews(){
        self.contentMode = .scaleAspectFill
        self.noAutoConst()
    }
}
