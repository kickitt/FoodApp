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
    @IBOutlet private var BottomConstraint: NSLayoutConstraint!
    
    
    var onRegSuccess: ((User)->())?
    var onRegFailure: (()->())?
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func setupView() {
        super.setupView()
        title = "Sign in"
        
        nameField?.delegate = self
        nameField?.placeholder = "Name"
        nameField?.returnKeyType = .next
        nameField?.enablesReturnKeyAutomatically = true
        nameField?.autocorrectionType = .no
        nameField?.textContentType = .name
        nameField?.clearButtonMode = .whileEditing
        
        emailField?.delegate = self
        emailField?.placeholder = "E-mail"
        emailField?.returnKeyType = .next
        emailField?.enablesReturnKeyAutomatically = true
        emailField?.autocorrectionType = .no
        emailField?.textContentType = .emailAddress
        emailField?.clearButtonMode = .whileEditing
        
        phoneField?.delegate = self
        phoneField?.placeholder = "Phone"
        phoneField?.returnKeyType = .next
        phoneField?.enablesReturnKeyAutomatically = true
        phoneField?.autocorrectionType = .no
        phoneField?.textContentType = .telephoneNumber
        phoneField?.clearButtonMode = .whileEditing
        
        passField?.delegate = self
        passField?.placeholder = "Password"
        passField?.returnKeyType = .next
        passField?.enablesReturnKeyAutomatically = true //??
        passField?.autocorrectionType = .no
        passField?.textContentType = .password
        passField?.clearButtonMode = .whileEditing
        passField?.isSecureTextEntry = true
        
        confirmPassField?.delegate = self
        confirmPassField?.placeholder = "Password"
        confirmPassField?.returnKeyType = .done
        confirmPassField?.enablesReturnKeyAutomatically = true //??
        confirmPassField?.autocorrectionType = .no
        confirmPassField?.textContentType = .password
        confirmPassField?.clearButtonMode = .whileEditing
        confirmPassField?.isSecureTextEntry = true
        
        confirmButton?.isEnabled = false
        confirmButton?.backgroundColor = UIColor(red: 24/255, green: 105/255, blue: 132/255, alpha: 0.3)
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(
            forName: UIResponder.keyboardWillChangeFrameNotification,
            object: nil, queue: .main) { [weak self] (notification) in
                self?.handleKeyboard(notification: notification)
        }
        notificationCenter.addObserver(
            forName: UIResponder.keyboardWillHideNotification,
            object: nil, queue: .main) { [weak self] (notification) in
                self?.handleKeyboard(notification: notification)
        }
        
    }
    
    //MARK: - Actions
    @IBAction private func confirmButtonClicked() {
        
        if
            let nameF = nameField,
            let emailF = emailField,
            let phoneF = phoneField,
            let passF = passField,
            let confirmPassF = confirmPassField,
            FieldsValidator.isNameValid(nameF.text!),
            FieldsValidator.isEmailValid(emailF.text!),
            FieldsValidator.isPhoneValid(phoneF.text!),
            FieldsValidator.isPassValid(passF.text!),
            FieldsValidator.isPassConfirmed(passF.text!, confirmPassF.text!){
            let user = User(name: nameF.text!, email: emailF.text!, phone: phoneF.text!, password: confirmPassF.text!, photo: nil)
            onRegSuccess?(user)
        } else {
            onRegFailure?()
        }
    }
    
    @IBAction private func editingChanged(_ textField: UITextField) {
        
        guard let nameF = nameField,
            let emailF = emailField,
            let phoneF = phoneField,
            let passF = passField,
            let confirmPassF = confirmPassField else {
                return
        }
        
        if nameF.text!.count > 0 && emailF.text!.count > 0 && phoneF.text!.count > 0 && passF.text!.count > 0 && confirmPassF.text!.count > 0 {
            confirmButton?.isEnabled = true
            confirmButton?.backgroundColor = UIColor(red: 24/255, green: 105/255, blue: 132/255, alpha: 1)
        } else  {
            confirmButton?.isEnabled = false
            confirmButton?.backgroundColor = UIColor(red: 24/255, green: 105/255, blue: 132/255, alpha: 0.3)
        }
    }
    
    //MARK: - Private Methods
    
    func handleKeyboard(notification: Notification) {
       // 1
      guard notification.name == UIResponder.keyboardWillChangeFrameNotification else {
        BottomConstraint.constant = 0
        view.layoutIfNeeded()
        return
      }

      guard
        let info = notification.userInfo,
        let keyboardFrame = info[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue
        else {
          return
      }
        
      // 2
      let keyboardHeight = keyboardFrame.cgRectValue.size.height
      UIView.animate(withDuration: 0.1, animations: { () -> Void in
        self.BottomConstraint.constant = keyboardHeight
        self.view.layoutIfNeeded()
      })
    }
    
    //MARK: - UITextFieldDelegate
    
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
