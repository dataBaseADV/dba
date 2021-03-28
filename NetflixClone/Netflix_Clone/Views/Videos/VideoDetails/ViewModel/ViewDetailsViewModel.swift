//
//  ViewDetailsViewModel.swift
//  Netflix_Clone
//
//  Created by Shyngys Saktagan on 28.03.2021.
//  Copyright © 2021 YODA. All rights reserved.
//

import UIKit

class ViewDetailsViewModel: NSObject {
    let model: NetflixVideoModel
    
    var title: String {
        get {
            model.title
        }
    }
    
    var release_year: String {
        get {
            model.release_year
        }
    }
    
    var coutry: String {
        get {
            model.coutry
        }
    }
    
    var duration: String {
        get {
            model.duration
        }
    }
    
    var director: String {
        get {
            String(model.director.split(separator: " ")[0])
        }
    }
    
    var type: String {
        get {
            model.type
        }
    }
    
    var rating: String {
        get {
            model.rating
        }
    }

    var videoDescription: String {
        get {
            model.description
        }
    }
    
    init(model: NetflixVideoModel) {
        self.model = model
    }
}
