//
//  AddNewProfileViewController.swift
//  Netflix_Clone
//
//  Created by Shyngys Saktagan on 28.03.2021.
//  Copyright © 2020 YODA. All rights reserved.
//

import UIKit

class AddNewProfileViewController: UIViewController {

    let btnSave = Button()
    let btnCancel = Button()
    let imgProfileIcon = ImageView(image: #imageLiteral(resourceName: "add_profile"))
    let txtProfileName = TextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    func setupViews(){
        self.view.addSubview(btnSave)
        self.view.addSubview(btnCancel)
        self.view.addSubview(imgProfileIcon)
        self.view.addSubview(txtProfileName)
    }
    

}
