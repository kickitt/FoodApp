//
//  KuponsCoordinator.swift
//  lesson31_Auth_Flow+AppCoordinator
//
//  Created by Yurii Bosov on 17.07.2020.
//  Copyright © 2020 Bosov. All rights reserved.
//

import UIKit

class KuponsCoordinator: Coordinator {
    
    let rootController = NavigationController()
    
    override func startFlow() {
        if let controller = R.storyboard.kupons.kuponsController() {
            rootController.viewControllers = [controller]
        }
    }
}
