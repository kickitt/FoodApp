//
//  LoginController.swift
//  lesson31_Auth_Flow
//
//  Created by Yurii Bosov on 10.07.2020.
//  Copyright © 2020 Bosov. All rights reserved.
//

import UIKit

class LoginController: BaseViewController {

    var onLoginSuccess: ((User, LoginController)->())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
    }
    
    @IBAction private func loginButtonClicked() {
        let user = User(name: "Yurii", email: "bosov.yu@gmai.com", password: "111111", photo: nil)
        onLoginSuccess?(user, self)
    }
    
}
