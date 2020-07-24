//
//  File.swift
//  lesson31_Auth_Flow+AppCoordinator
//
//  Created by Roman Berezin on 22.07.2020.
//  Copyright © 2020 Bosov. All rights reserved.
//

import UIKit
import SnapKit

class RestoreController: BaseViewController, UITextFieldDelegate {
    
    private var scrollView = UIScrollView()
    private var headerLabel = UILabel()
    private var phoneField = UITextField()
    private var smsField = UITextField()
    private var passField = UITextField()
    private var confirmPassField = UITextField()
    private var proceedButton = AuthButton(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width - 160, height: 30))
    private var confirmButton = AuthButton(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width - 160, height: 30))
    private var finishButton = AuthButton(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width - 160, height: 30))
    
    var userConfirmedAlert: Bool = false {
        didSet {
            setupSmsLayout()
        }
    }
    var code: String = ""
    
    var onProceedSuccess: ((RestoreController)->())?
    var onProceedFailure: ((RestoreController)->())?
    var onConfirmSuccess: ((RestoreController)->())?
    var onConfirmFailure: (()->())?
    var onFinishSuccess: ((RestoreController, User)->())?
    var onFinishFailure: (()->())?
    
    override func setupView() {
        super.setupView()
        setupPhoneLayout()
    }
    
    private func setupPhoneLayout() {
        
        proceedButton.setTitle("Proceed", for: .normal)
        proceedButton.setTitleColor(.black, for: .normal)
        proceedButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        proceedButton.isEnabled = false
        proceedButton.addTarget(self, action: #selector(onProceedButtonClicked), for: .touchUpInside)
        
        headerLabel.text = "Please provide your phone number to restore password"
        headerLabel.textAlignment = .center
        headerLabel.numberOfLines = 2
        
        phoneField.delegate = self
        phoneField.placeholder = "Phone: 380991234567"
        phoneField.keyboardType = .numberPad
        phoneField.returnKeyType = .send
        phoneField.enablesReturnKeyAutomatically = true
        phoneField.autocorrectionType = .no
        phoneField.backgroundColor = .white
        phoneField.borderStyle = .roundedRect
        phoneField.textContentType = .telephoneNumber
        phoneField.clearButtonMode = .whileEditing
        phoneField.addTarget(self, action: #selector(editingChanged(_:)), for: .editingChanged)
        
        view.addSubview(scrollView)
        scrollView.addSubview(headerLabel)
        scrollView.addSubview(phoneField)
        scrollView.addSubview(proceedButton)
        
        scrollView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
        
        headerLabel.snp.makeConstraints { maker in
            maker.top.equalTo(view.safeAreaLayoutGuide).inset(40)
            maker.left.equalTo(view.safeAreaLayoutGuide).inset(40)
            maker.right.equalTo(view.safeAreaLayoutGuide).inset(40)
            maker.centerX.equalToSuperview()
        }
        
        phoneField.snp.makeConstraints { maker in
            maker.top.equalTo(headerLabel.snp.bottom).offset(50)
            maker.left.equalTo(view.safeAreaLayoutGuide).inset(40)
            maker.right.equalTo(view.safeAreaLayoutGuide).inset(40)
        }
        
        proceedButton.snp.makeConstraints { maker in
            maker.top.equalTo(phoneField.snp.bottom).offset(20)
            maker.left.equalTo(view.safeAreaLayoutGuide).inset(80)
            maker.right.equalTo(view.safeAreaLayoutGuide).inset(80)
            maker.bottom.greaterThanOrEqualToSuperview()
        }
    }
    
    private func setupSmsLayout() {
        
        for view in scrollView.subviews {
            view.removeFromSuperview()
        }
        
        confirmButton.setTitle("Confirm", for: .normal)
        confirmButton.setTitleColor(.black, for: .normal)
        confirmButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        confirmButton.isEnabled = false
        confirmButton.addTarget(self, action: #selector(onConfirmButtonClicked), for: .touchUpInside)
        
        headerLabel.text = "Please enter the Code\n \(code)"
        headerLabel.textAlignment = .center
        headerLabel.numberOfLines = 2
        
        smsField.delegate = self
        smsField.placeholder = "Code"
        smsField.keyboardType = .numberPad
        smsField.returnKeyType = .send
        smsField.enablesReturnKeyAutomatically = true
        smsField.autocorrectionType = .no
        smsField.backgroundColor = .white
        smsField.borderStyle = .roundedRect
        smsField.textContentType = .oneTimeCode
        smsField.clearButtonMode = .whileEditing
        smsField.addTarget(self, action: #selector(editingChanged(_:)), for: .editingChanged)
        
        scrollView.addSubview(headerLabel)
        scrollView.addSubview(smsField)
        scrollView.addSubview(confirmButton)
        
        scrollView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
        
        headerLabel.snp.makeConstraints { maker in
            maker.top.equalTo(view.safeAreaLayoutGuide).inset(40)
            maker.left.equalTo(view.safeAreaLayoutGuide).inset(40)
            maker.right.equalTo(view.safeAreaLayoutGuide).inset(40)
            maker.centerX.equalToSuperview()
        }
        
        smsField.snp.makeConstraints { maker in
            maker.top.equalTo(headerLabel.snp.bottom).offset(50)
            maker.left.equalTo(view.safeAreaLayoutGuide).inset(40)
            maker.right.equalTo(view.safeAreaLayoutGuide).inset(40)
        }
        
        confirmButton.snp.makeConstraints { maker in
            maker.top.equalTo(smsField.snp.bottom).offset(20)
            maker.left.equalTo(view.safeAreaLayoutGuide).inset(80)
            maker.right.equalTo(view.safeAreaLayoutGuide).inset(80)
            maker.bottom.greaterThanOrEqualToSuperview()
            
        }
    }
    
    private func setupFinishLayout() {
        
        for view in scrollView.subviews {
            view.removeFromSuperview()
        }
        
        finishButton.setTitle("Finish", for: .normal)
        finishButton.setTitleColor(.black, for: .normal)
        finishButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        finishButton.isEnabled = false
        finishButton.addTarget(self, action: #selector(onFinishButtonClicked), for: .touchUpInside)
        
        headerLabel.text = "Please enter new Password\n"
        headerLabel.textAlignment = .center
        headerLabel.numberOfLines = 2
        
        passField.delegate = self
        passField.placeholder = "New Password: min 8 characters"
        passField.returnKeyType = .next
        passField.enablesReturnKeyAutomatically = true
        passField.autocorrectionType = .no
        passField.backgroundColor = .white
        passField.borderStyle = .roundedRect
        passField.textContentType = .password
        passField.clearButtonMode = .whileEditing
        passField.isSecureTextEntry = true
        passField.addTarget(self, action: #selector(editingChanged(_:)), for: .editingChanged)
        
        confirmPassField.delegate = self
        confirmPassField.placeholder = "Confirm Password"
        confirmPassField.returnKeyType = .done
        confirmPassField.enablesReturnKeyAutomatically = true
        confirmPassField.autocorrectionType = .no
        confirmPassField.backgroundColor = .white
        confirmPassField.borderStyle = .roundedRect
        confirmPassField.textContentType = .password
        confirmPassField.clearButtonMode = .whileEditing
        confirmPassField.isSecureTextEntry = true
        confirmPassField.addTarget(self, action: #selector(editingChanged(_:)), for: .editingChanged)
        
        scrollView.addSubview(headerLabel)
        scrollView.addSubview(passField)
        scrollView.addSubview(confirmPassField)
        scrollView.addSubview(finishButton)
        
        scrollView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
        
        headerLabel.snp.makeConstraints { maker in
            maker.top.equalTo(view.safeAreaLayoutGuide).inset(40)
            maker.left.equalTo(view.safeAreaLayoutGuide).inset(40)
            maker.right.equalTo(view.safeAreaLayoutGuide).inset(40)
            maker.centerX.equalToSuperview()
        }
        
        passField.snp.makeConstraints { maker in
            maker.top.equalTo(headerLabel.snp.bottom).offset(50)
            maker.left.equalTo(view.safeAreaLayoutGuide).inset(40)
            maker.right.equalTo(view.safeAreaLayoutGuide).inset(40)
        }
        
        confirmPassField.snp.makeConstraints { maker in
            maker.top.equalTo(passField.snp.bottom).offset(40)
            maker.left.equalTo(view.safeAreaLayoutGuide).inset(40)
            maker.right.equalTo(view.safeAreaLayoutGuide).inset(40)
        }
        
        finishButton.snp.makeConstraints { maker in
            maker.top.equalTo(confirmPassField.snp.bottom).offset(20)
            maker.left.equalTo(view.safeAreaLayoutGuide).inset(80)
            maker.right.equalTo(view.safeAreaLayoutGuide).inset(80)
            maker.bottom.greaterThanOrEqualToSuperview()
            
        }
    }
    
    //MARK: - Private Functions
    
    @objc private func editingChanged(_ textField: UITextField) {
        textField.layer.borderWidth = 0
        if textField == phoneField && textField.text?.count != 0 {
            proceedButton.isEnabled = true
        } else if textField == smsField && smsField.text?.count != 0 {
            confirmButton.isEnabled = true
        } else if passField.text?.count != 0 && confirmPassField.text?.count != 0{
            finishButton.isEnabled = true
        }
    }
    
    @objc private func onProceedButtonClicked() {
        if FieldsValidator.isPhoneValid(phoneField) {
            onProceedSuccess?(self)
            //TODO: MOCK.DB.request
        } else {
            onProceedFailure?(self)
        }
        
    }
    
    @objc private func onConfirmButtonClicked() {
        print(code)
        if smsField.text == code {
            onConfirmSuccess?(self)
            setupFinishLayout()
        } else {
            onConfirmFailure?()
        }
    }
    
    @objc private func onFinishButtonClicked() {
        if
            FieldsValidator.isPassValid(passField),
            FieldsValidator.isPassConfirmed(passField, confirmPassField) {
            let user = User(name: "Test", email: "TEST@TEST.TEST", phone: nil, password: phoneField.text!, photo: nil)
            onFinishSuccess?(self, user)
            //TODO: MOCK.DB.UPDATE
        } else {
            onFinishFailure?()
        }
    }
    
    //MARK: - UITextFieldDelegate
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == phoneField {
            onProceedButtonClicked()
        } else if textField == smsField {
            onConfirmButtonClicked()
        } else if textField == passField {
            confirmPassField.becomeFirstResponder()
        } else {
            confirmPassField.resignFirstResponder()
            onFinishButtonClicked()
        }
        return true
    }
}
