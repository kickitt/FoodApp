//
//  RegistrationController.swift
//  lesson31_Auth_Flow
//
//  Created by Yurii Bosov on 10.07.2020.
//  Copyright © 2020 Bosov. All rights reserved.
//

import UIKit

class RegistrationController: BaseViewController, UITextFieldDelegate {
    
    @IBOutlet private var nameField: UITextField?
    @IBOutlet private var emailField: UITextField?
    @IBOutlet private var phoneField: UITextField?
    @IBOutlet private var passField: UITextField?
    @IBOutlet private var confirmPassField: UITextField?
    @IBOutlet private var confirmButton: UIButton?
    
    var onRegSuccess: ((User)->())?
    var onRegFailure: (()->())?
    
    override func setupView() {
        super.setupView()
        title = "Sign in"
        
        nameField?.delegate = self
        nameField?.placeholder = "Name: First Last"
        nameField?.returnKeyType = .next
        nameField?.enablesReturnKeyAutomatically = true
        nameField?.autocorrectionType = .no
        nameField?.textContentType = .name
        nameField?.clearButtonMode = .whileEditing
        
        emailField?.delegate = self
        emailField?.placeholder = "E-mail: user@mydomen.com"
        emailField?.returnKeyType = .next
        emailField?.enablesReturnKeyAutomatically = true
        emailField?.autocorrectionType = .no
        emailField?.textContentType = .emailAddress
        emailField?.clearButtonMode = .whileEditing
        
        phoneField?.delegate = self
        phoneField?.placeholder = "Phone: 380991234567"
        phoneField?.returnKeyType = .next
        phoneField?.enablesReturnKeyAutomatically = true
        phoneField?.autocorrectionType = .no
        phoneField?.textContentType = .telephoneNumber
        phoneField?.clearButtonMode = .whileEditing
        
        passField?.delegate = self
        passField?.placeholder = "Password: min 8 charachters"
        passField?.returnKeyType = .next
        passField?.enablesReturnKeyAutomatically = true //??
        passField?.autocorrectionType = .no
        passField?.textContentType = .password
        passField?.clearButtonMode = .whileEditing
        passField?.isSecureTextEntry = false//true
        
        confirmPassField?.delegate = self
        confirmPassField?.placeholder = "Confirm password"
        confirmPassField?.returnKeyType = .done
        confirmPassField?.enablesReturnKeyAutomatically = true //??
        confirmPassField?.autocorrectionType = .no
        confirmPassField?.textContentType = .password
        confirmPassField?.clearButtonMode = .whileEditing
        confirmPassField?.isSecureTextEntry = false//true
        
        confirmButton?.isEnabled = false
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    //MARK: Override Deinit
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    //MARK: - Actions
    
    @IBAction private func touchesBegun() {
        view.endEditing(true)
    }
    
    @IBAction private func confirmButtonClicked() {
        if
            let nameF = nameField,
            let emailF = emailField,
            let phoneF = phoneField,
            let passF = passField,
            let confirmPassF = confirmPassField
        {
            let isNameValid = FieldsValidator.isNameValid(nameF)
            let isEmailValid = FieldsValidator.isEmailValid(emailF)
            let isPhoneValid = FieldsValidator.isPhoneValid(phoneF)
            let isPassValid = FieldsValidator.isPassValid(passF)
            let isPassConfirmed = FieldsValidator.isPassConfirmed(passF, confirmPassF)
            
            if isNameValid && isEmailValid && isPhoneValid && isPassValid && isPassConfirmed {
                let user = User(name: nameF.text!, email: emailF.text!, phone: phoneF.text!, password: confirmPassF.text!, photo: nil)
                onRegSuccess?(user)
            } else {
                onRegFailure?()
            }
        } else {
            onRegFailure?()
        }
    }
    
    @IBAction private func editingChanged(_ textField: UITextField) {
        textField.layer.borderWidth = 0
        guard let nameF = nameField,
            let emailF = emailField,
            let phoneF = phoneField,
            let passF = passField,
            let confirmPassF = confirmPassField else {
                return
        }
        
        if nameF.text!.count > 0 && emailF.text!.count > 0 && phoneF.text!.count > 0 && passF.text!.count > 0 && confirmPassF.text!.count > 0 {
            confirmButton?.isEnabled = true
        } else  {
            confirmButton?.isEnabled = false
        }
    }
    
    //MARK: - Private Methods
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if self.view.frame.origin.y == 0 {
            self.view.frame.origin.y -= 80
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    //MARK: - UITextFieldDelegate
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case nameField:
            FieldsFormatter.nameFormatter(textField)
        case phoneField:
            FieldsFormatter.phoneFormatter(textField)
        default:
            break
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case nameField:
            emailField?.becomeFirstResponder()
        case emailField:
            phoneField?.becomeFirstResponder()
        case phoneField:
            passField?.becomeFirstResponder()
        case passField:
            confirmPassField?.becomeFirstResponder()
        default:
            confirmPassField?.resignFirstResponder()
            confirmButtonClicked()
        }
        return true
    }
    
}
