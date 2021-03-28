//
//  SearchViewModel.swift
//  Netflix_Clone
//
//  Created by Shyngys Saktagan on 28.03.2021.
//  Copyright © 2021 YODA. All rights reserved.
//

import UIKit

class SearchViewModel: NSObject {
    var model: [NetflixVideoModel]
    var searchModel: [NetflixVideoModel] = []
    let title: String
    
    func getModel(at index: Int) -> NetflixVideoModel {
        return model[index]
    }
    
    func getModelCount() -> Int {
        return model.count
    }
    
    init(model: [NetflixVideoModel], title: String) {
        self.model = model
        self.title = title
    }
}
