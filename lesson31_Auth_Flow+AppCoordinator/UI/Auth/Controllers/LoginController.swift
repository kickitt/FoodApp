//
//  LoginController.swift
//  lesson31_Auth_Flow
//
//  Created by Yurii Bosov on 10.07.2020.
//  Copyright © 2020 Bosov. All rights reserved.
//

import UIKit

class LoginController: BaseViewController, UITextFieldDelegate {
    
    @IBOutlet private var emailField: UITextField?
    @IBOutlet private var passField: UITextField?
    @IBOutlet private var confirmButton: UIButton?
    @IBOutlet private var regButton: UIButton?
    
    var onLoginSuccess: ((User, LoginController)->())?
    var onLoginFailure: ((LoginController)->())?
    var onSignIn: (()->())?
    var onRestore: (()->())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func setupView() {
        super.setupView()
        
        title = "Login"
        
        emailField?.delegate = self
        emailField?.placeholder = "E-mail"
        emailField?.returnKeyType = .next
        emailField?.enablesReturnKeyAutomatically = true
        emailField?.autocorrectionType = .no
        emailField?.textContentType = .emailAddress
        emailField?.clearButtonMode = .whileEditing
        
        passField?.delegate = self
        passField?.placeholder = "Password"
        passField?.returnKeyType = .done
        passField?.enablesReturnKeyAutomatically = true //??
        passField?.autocorrectionType = .no
        passField?.textContentType = .password
        passField?.clearButtonMode = .whileEditing
        passField?.isSecureTextEntry = true
        
        confirmButton?.isEnabled = false
    }
    
    //MARK: - Actions
    
    @IBAction private func editingChanged(_ textField: UITextField) {
        
        guard let emailF = emailField, let passF = passField else {
            return
        }
        
        if emailF.text!.count > 0 && passF.text!.count > 0{
            confirmButton?.isEnabled = true
        } else  {
            confirmButton?.isEnabled = false
        }
    }
    
    @IBAction private func loginButtonClicked() {
        
        guard let emailF = emailField, let passF = passField else {
            return
        }
        
        if FieldsValidator.isEmailValid(emailF.text!), FieldsValidator.isPassValid(passF.text!) {
            //IF USER EXIST IN BASE return his settings
            let user = User(name: nil, email: emailF.text!, phone: nil, password: passF.text!, photo: nil)
            onLoginSuccess?(user, self)
            //TODO: MOCK.DB
            //onLoginSuccess?(self)
        } else {
            onLoginFailure?(self)
        }
    }
    
    @IBAction private func signInButtonClicked() {
        onSignIn?()
    }
    
    @IBAction private func restoreButtonClicked() {
        onRestore?()
    }
    
    //MARK: - UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == emailField {
            passField?.becomeFirstResponder()
        } else {
            passField?.resignFirstResponder()
            loginButtonClicked()
        }
        return true
    }
    
}