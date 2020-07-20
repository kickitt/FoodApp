//
//  KuponsController.swift
//  lesson31_Auth_Flow+AppCoordinator
//
//  Created by Yurii Bosov on 17.07.2020.
//  Copyright © 2020 Bosov. All rights reserved.
//

import UIKit

class KuponsController: BaseViewController {
    
    override func setupController() {
        self.title = "Kupons"
        self.tabBarItem = UITabBarItem(title: "Kupons", image: R.image.kuponIcon(), tag: 0)
    }
}
