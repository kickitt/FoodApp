//
//  SettingsController.swift
//  lesson31_Auth_Flow+AppCoordinator
//
//  Created by Yurii Bosov on 17.07.2020.
//  Copyright © 2020 Bosov. All rights reserved.
//

import UIKit

class SettingsController: BaseViewController {

    var user: User?
    var onLogoutClicked: (()->())?
        
    override func setupController() {
        self.title = "Settings"
        self.tabBarItem = UITabBarItem(title: "Settings",
                                       image: R.image.settingsIcon(),
                                       tag: 0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = user?.name
    }
    
    @IBAction private func logoutButtonClicked() {
        onLogoutClicked?()
    }

}
