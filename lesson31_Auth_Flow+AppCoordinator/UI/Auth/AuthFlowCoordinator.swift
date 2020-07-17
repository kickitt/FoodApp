//
//  AuthFlowCoordinator.swift
//  lesson31_Auth_Flow+AppCoordinator
//
//  Created by Roman Berezin on 17.07.2020.
//  Copyright © 2020 Bosov. All rights reserved.
//

import UIKit
import Rswift

class AuthFlowCoordinator: AppCoordinator {
    
    var onAuthSuccess: (()->())?
    
    override func start() {
       startLogin()
    }

    private func startLogin() {
        if let controller = R.storyboard.login.loginController() {
            controller.onLoginSuccess = { user, _ in
                self.settings.registerUser(user)
                self.onAuthSuccess?()
            }
            controller.onLoginFailure = { _ in
                let alert = UIAlertController(title: "Something wrong", message: "Check your e-mail or pass \n Sign in if you have no account", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                controller.present(alert, animated: true, completion: nil)
            }
            controller.onSignIn = {
                self.startSignIn()
            }
            
            let navController = NavigationController.init(rootViewController: controller)
            window?.rootViewController = navController        }
   }
    
    private func startSignIn() {
        if let controller = R.storyboard.registration.registrationController() {
            controller.onRegSuccess = { [weak self] user, _ in
                self?.settings.registerUser(user)
                self?.onAuthSuccess!()
            }
            controller.onRegFailure = { _ in
                let alert = UIAlertController(title: "Something wrong", message: "Feel all fields correctly", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                controller.present(alert, animated: true, completion: nil)
            }
             let navController = NavigationController.init(rootViewController: controller)
             window?.rootViewController = navController
         }
    }

    private func startResetPass() {
         
    }
    
}
