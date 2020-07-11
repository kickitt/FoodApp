//
//  AppCoordinator.swift
//  lesson31_Auth_Flow+AppCoordinator
//
//  Created by Yurii Bosov on 10.07.2020.
//  Copyright © 2020 Bosov. All rights reserved.
//

import UIKit
import Rswift

class AppCoordinator {
    
    private let window: UIWindow?
    private let settings: AppSettings
    
    init(window: UIWindow?, settings: AppSettings) {
        self.window = window
        self.settings = settings
    }
    
    func start() {
        if settings.isShowedTutorial {
            if settings.isUserLogged {
                startMainFlow()
            } else {
                startAuthFlow()
            }
        } else {
            startTutorialFlow()
        }
    }
    
    private func startTutorialFlow() {
        if let controller = R.storyboard.tutorial.tutorialController() {
            controller.onAppStarted = { [weak self] _ in
                self?.settings.isShowedTutorial = true
                self?.start()
            }
            let navController = NavigationController.init(rootViewController: controller)
            window?.rootViewController = navController
        }
    }
    
    private func startMainFlow() {
        if let controller = R.storyboard.main.mainController() {
            controller.onLogout = { [weak self] _ in
                self?.settings.logoutUser()
                self?.start()
            }
            let navController = NavigationController.init(rootViewController: controller)
            window?.rootViewController = navController
        }
    }
    
    private func startAuthFlow() {
        if let controller = R.storyboard.auth.loginController() {
            controller.onLoginSuccess = { [weak self] user,_ in
                self?.settings.loginUser(user)
                self?.start()
            }
            let navController = NavigationController.init(rootViewController: controller)
            window?.rootViewController = navController
        }
    }
}
