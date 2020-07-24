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
        let tutorialCoordinator = TutorialCoordinator(window: window, settings: settings)
        tutorialCoordinator.startFlow()
        tutorialCoordinator.onTutorialIsFinish = { [weak self] coordinator in
            self?.removeChildrenCoordinator(coordinator: coordinator)
            self?.settings.isShowedTutorial = true
            self?.startFlow()
        }
        self.addChildrenCoordinator(coordinator: tutorialCoordinator)
    }
    
    private func startMainFlow() {
        let coordinator = MainCoordinator(window: window, appSettings: settings)
        coordinator.onSuccessFlow = { [weak self] coordinator in
            self?.removeChildrenCoordinator(coordinator: coordinator)
            self?.settings.logoutUser()
            self?.startFlow()
        }
        
        self.addChildrenCoordinator(coordinator: coordinator)
        coordinator.startFlow()
    }
    
    private func startAuthFlow() {
        let coordinator = AuthFlowCoordinator(window: window, rootViewController: NavigationController())
        
        coordinator.onSuccessFlow = { [weak self] coordinator, user in
            self?.removeChildrenCoordinator(coordinator: coordinator)
            self?.settings.loginUser(user)
            self?.startMainFlow()
        }
        
        self.addChildrenCoordinator(coordinator: coordinator)
        coordinator.startFlow()
    }
}
