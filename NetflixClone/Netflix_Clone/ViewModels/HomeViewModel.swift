//
//  HomeViewModel.swift
//  Netflix_Clone
//
//  Created by Shyngys Saktagan on 28.03.2021.
//  Copyright © 2020 YODA. All rights reserved.
//

import UIKit

class HomeViewModel: NSObject {
        
    var allvideos: [NetflixVideoModel]
    var tvShows: [NetflixVideoModel]
    var movies: [NetflixVideoModel]
    
    init(allvideos: [NetflixVideoModel], tvShows: [NetflixVideoModel], movies: [NetflixVideoModel]) {
        self.allvideos = allvideos
        self.tvShows = tvShows
        self.movies = movies
    }
    
    func addVideo(video: NetflixVideoModel) {
        allvideos.append(video)
    }
}
