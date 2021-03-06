//
//  LandingViewModel.swift
//  Netflix_Clone
//
//  Created by Shyngys Saktagan on 28.03.2021.
//  Copyright © 2020 YODA. All rights reserved.
//

import UIKit


class LandingViewModel: NSObject {
    
    private var appFeatures: [LandingFeature] = []

    override init() {
        appFeatures.append(LandingFeature(headline: "Trying to join netflix?",
                                          description: "You can't sign up for Netflix in app. We know it's a hassle. After you're a member, you can start watching in the app",
                                          imgIcon: nil))
        appFeatures.append(LandingFeature(headline: "Watch on any device",
                                          description: "Stream on your phone, tablet, laptop, and TV",
                                          imgIcon: #imageLiteral(resourceName: "watch_on_device")))
        appFeatures.append(LandingFeature(headline: "Download and go",
                                          description: "Save your data, watch offline on a plane, train, or submarine...",
                                          imgIcon: #imageLiteral(resourceName: "download_go")))
        appFeatures.append(LandingFeature(headline: "No pesky contacts",
                                          description: "Cancel anytime",
                                          imgIcon: #imageLiteral(resourceName: "no_peskey")))
    }
    
    func appFeatureForIndex(index: Int) -> LandingFeature? {
        return appFeatures[index]
    }
}
