//
//  AppCoordinator.swift
//  lesson31_Auth_Flow+AppCoordinator
//
//  Created by Yurii Bosov on 10.07.2020.
//  Copyright © 2020 Bosov. All rights reserved.
//

import UIKit
import Rswift

class AppCoordinator: CoordinatorProtocol {
    
    let window: UIWindow?
    let settings: AppSettings
    
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
        let tutorialCoordinator = TutorialCoordinator(window: window, settings: settings)
        tutorialCoordinator.start()
        tutorialCoordinator.onTutorialIsFinish = {
            self.start()
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
        let authFlowCoordinator = AuthFlowCoordinator(window: window, settings: settings)
        authFlowCoordinator.start()
        authFlowCoordinator.onAuthSuccess = {
            self.start()
        }
    }
}
