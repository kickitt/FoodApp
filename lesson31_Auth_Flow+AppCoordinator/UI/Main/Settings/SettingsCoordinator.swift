//
//  SettingsCoordinator.swift
//  lesson31_Auth_Flow+AppCoordinator
//
//  Created by Yurii Bosov on 17.07.2020.
//  Copyright © 2020 Bosov. All rights reserved.
//

import UIKit

class SettingsCoordinator: Coordinator {

    let rootController = NavigationController()
    
    var onLogout: (()->())?
    
    private var appSettings: AppSettings
    
    init(window: UIWindow, appSettings: AppSettings) {
        self.appSettings = appSettings
        super.init(window: window)
    }
    
    override func startFlow() {
        if let controller = R.storyboard.settings.settingsController() {
            controller.user = appSettings.currentUser
            controller.onLogoutClicked = { [weak self] in
                self?.onLogout?()
            }
            rootController.viewControllers = [controller]
        }
    }
}
