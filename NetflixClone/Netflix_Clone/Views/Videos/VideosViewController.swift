//
//  VideosViewController.swift
//  Netflix_Clone
//
//  Created by Shyngys Saktagan on 28.03.2021.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit

class VideosViewController: UITabBarController {
    
    
    private(set) var videos: [NetflixVideoModel] = []
    private(set) var tvShows: [NetflixVideoModel] = []
    private(set) var movies: [NetflixVideoModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDatas()
        self.setupTabBarOptions()
    }
    
    private func getDatas() {
        movies = Queries.shared.getMovies()
        tvShows = Queries.shared.getTvShows()
        videos = Queries.shared.getVieos()
    }
    
    private func setupTabBarOptions(){
        self.view.backgroundColor = .rgba(r: 0, g: 0, b: 0, a: 1)
        
        viewControllers = [
            addNavigationCongtroller(vc: HomeViewController(viewModel: HomeViewModel(allvideos: videos,
                                                                                     tvShows: tvShows,
                                                                                     movies: movies)),
                                     title: "Search", icon: #imageLiteral(resourceName: "tb_home")),
            addNavigationCongtroller(vc: SearchViewController(viewModel: SearchViewModel(model: videos, title: "Search")),
                                     title: "Search", icon: #imageLiteral(resourceName: "tb_search")),
            
            addNavigationCongtroller(vc: MoreViewController(), title: "More", icon: #imageLiteral(resourceName: "tb_more"), hiden: true)
        ]
        
        tabBar.barTintColor =  UIColor.rgba(r: 10, g: 10, b: 10, a: 1)
        tabBar.tintColor = .white
        tabBar.isTranslucent = false
        UITabBar.appearance().backgroundColor = UIColor.rgba(r: 0, g: 0, b: 0, a: 1)
    }
    
    private func addNavigationCongtroller(vc: UIViewController, title: String, icon: UIImage, hiden: Bool = false) -> UINavigationController {
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = icon
        navController.navigationBar.isHidden = hiden
        return navController
    }
}
