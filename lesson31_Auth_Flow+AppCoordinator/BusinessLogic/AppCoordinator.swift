//
//  AppCoordinator.swift
//  lesson31_Auth_Flow+AppCoordinator
//
//  Created by Yurii Bosov on 10.07.2020.
//  Copyright © 2020 Bosov. All rights reserved.
//

import UIKit
import Rswift

class AppCoordinator: Coordinator {
    
    private let settings: AppSettings
    
    init(window: UIWindow, settings: AppSettings) {
        self.settings = settings
        super.init(window: window)
    }
    
    override func startFlow() {
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
                self?.startFlow()
            }
            let navController = NavigationController.init(rootViewController: controller)
            window.rootViewController = navController
        }
    }
    
    private func startMainFlow() {
        if let controller = R.storyboard.main.mainController() {
            controller.onLogout = { [weak self] _ in
                self?.settings.logoutUser()
                self?.startFlow()
            }
            let navController = NavigationController.init(rootViewController: controller)
            window.rootViewController = navController
        }
    }
    
    private func startAuthFlow() {
        let authFlowCoordinator = AuthFlowCoordinator(window: window, rootViewController: NavigationController())
        
        authFlowCoordinator.onSuccessFlow = { [weak self] coordinator, user in
            self?.removeChildrenCoordinator(coordinator: coordinator)
            self?.settings.loginUser(user)
            self?.startMainFlow()
        }
        
        self.addChildrenCoordinator(coordinator: authFlowCoordinator)
        authFlowCoordinator.startFlow()
    }
}
