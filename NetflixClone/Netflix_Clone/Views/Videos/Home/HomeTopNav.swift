//
//  HomeTopNav.swift
//  Netflix_Clone
//
//  Created by Shyngys Saktagan on 28.03.2021.
//  Copyright © 2020 YODA. All rights reserved.
//

import UIKit

class HomeTopNav: UIView {
    
    var showContries: (() -> ())?
    var showDirectors: (() -> ())?
    var showStatistics: (() -> ())?
    
    let imgLogo = ImageView(image: #imageLiteral(resourceName: "logo"))
    let btnTvShow: Button = {
        let btn = Button()
        btn.setAttrTitle(title: "Contries", color: .white, fontSize: 16, bold: true)
        btn.backgroundColor = .clear
        return btn
    }()
    
    let btnMovies : Button = {
        let btn = Button()
        btn.setAttrTitle(title: "Directors", color: .white, fontSize: 16, bold: true)
        btn.backgroundColor = .clear
        return btn
    }()
    
    let btnMyList : Button = {
        let btn = Button()
        btn.setAttrTitle(title: "Statistics", color: .white, fontSize: 16, bold: true)
        btn.backgroundColor = .clear
        return btn
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.noAutoConst()
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupViews() {
        self.addSubview(imgLogo)
        
        let stackView = UIStackView(arrangedSubviews: [btnTvShow, btnMovies, btnMyList])
        stackView.alignment  = .fill
        stackView.distribution = .equalSpacing
        stackView.noAutoConst()
        self.addSubview(stackView)
        imgLogo.addAnchor(left: self.leadingAnchor, 20, top: self.topAnchor, 20, bottom: self.bottomAnchor, w: 20)
        stackView.addAnchor(left: self.imgLogo.trailingAnchor, 50, right: self.trailingAnchor, 50, h: 40)
        stackView.centerYAnchor.constraint(equalTo: imgLogo.centerYAnchor).isActive = true
        
        btnTvShow.addTarget(self, action: #selector(onTapAction(_:)), for: .touchUpInside)
        btnMovies.addTarget(self, action: #selector(onTapAction(_:)), for: .touchUpInside)
        btnMyList.addTarget(self, action: #selector(onTapAction(_:)), for: .touchUpInside)
    }
    
    @objc func onTapAction(_ sender: UIButton){
        sender.onTapAnimation()
        guard let text = sender.titleLabel?.text else { return }
        switch text {
            case "Contries":
                let model = Queries.shared.getCountries()
                showContries?()
            case "Directors":
                showDirectors?()
            default:
                showStatistics?()
        }
        
    }
}
