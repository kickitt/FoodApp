//
//  AuthFlowCoordinator.swift
//  lesson31_Auth_Flow+AppCoordinator
//
//  Created by Roman Berezin on 17.07.2020.
//  Copyright © 2020 Bosov. All rights reserved.
//

import UIKit
import Rswift

class AuthFlowCoordinator: Coordinator {
    
    var onSuccessFlow: ((AuthFlowCoordinator?, User) -> ())?
    private let rootViewController: UINavigationController
    
    init(window: UIWindow, rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
        super.init(window: window)
    }
    
    override func startFlow() {
        startLogin()
    }
    
    private func startLogin() {
        if let controller = R.storyboard.auth.loginController() {
            controller.onLoginSuccess = { [weak self] user, _ in
                self?.onSuccessFlow?(self, user)
            }
            controller.onLoginFailure = { [weak self] _ in
                let alert = UIAlertController(title: "Something wrong", message: "Check your e-mail or pass \n Sign in if you have no account", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                self?.window.rootViewController?.present(alert, animated: true, completion: nil)
            }
            controller.onSignIn = { [weak self] in
                self?.startSignIn()
            }
            controller.onRestore = { [weak self] in
                self?.startResetPass()
            }
            
            rootViewController.viewControllers = [controller]
            window.rootViewController = rootViewController
        }
   }
    
    private func startSignIn() {
        if let controller = R.storyboard.auth.registrationController() {
            controller.onRegSuccess = { [weak self] user in
                self?.onSuccessFlow?(self, user)
            }
            controller.onRegFailure = { [weak self] in
                let alert = UIAlertController(title: "Something wrong", message: "Feel all fields correctly", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                self?.window.rootViewController?.present(alert, animated: true, completion: nil)
            }
            rootViewController.pushViewController(controller, animated: true)
         }
    }

    private func startResetPass() {
         if let controller = R.storyboard.auth.restorePasswordController() {
            rootViewController.pushViewController(controller, animated: true)
         }
    }
    
}
