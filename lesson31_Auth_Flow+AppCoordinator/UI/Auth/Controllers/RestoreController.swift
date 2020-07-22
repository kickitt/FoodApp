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
    private var proceedButton = AuthButton(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width - 160, height: 30))
    private var confirmButton = AuthButton(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width - 160, height: 30))
    
    var onProceedSuccess: (()->())?
    var onProceedFailure: (()->())?
    var onConfirmSuccess: ((User)->())?
    var onConfirmFailure: (()->())?
    
    override func setupView() {
        super.setupView()
        setupLayout()
    }
    
    func setupLayout() {
        
        proceedButton.setTitle("Proceed", for: .normal)
        proceedButton.setTitleColor(.black, for: .normal)
        proceedButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        proceedButton.isEnabled = false
        proceedButton.addTarget(self, action: #selector(onProceedButtonClicked), for: .touchUpInside)
        
        headerLabel.text = "Please provide your phone number to restore password"
        headerLabel.textAlignment = .center
        headerLabel.numberOfLines = 2
        
        phoneField.backgroundColor = .white
        phoneField.borderStyle = .roundedRect
        phoneField.placeholder = "Phone"
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
        }
    }
    
    
    //MARK: - Private Functions
    
    @objc private func onProceedButtonClicked() {
        
        if FieldsValidator.isEmailValid(phoneField.text!) {
            onProceedSuccess?()
            print("proceed")
            //TODO: MOCK.DB.request
        } else {
            onProceedFailure?()
        }
    }
    
    @objc private func onConfirmButtonClicked() {
        let user = User(name: "Test", email: "TEST@TEST.TEST", phone: nil, password: "test", photo: nil)
        onConfirmSuccess?(user)
        //TODO: MOCK.DB.UPDATE
    }
    
    @objc private func editingChanged(_ textField: UITextField) {
        if textField == phoneField && textField.text?.count != 0{
            proceedButton.isEnabled = true
        } else if textField == smsField && smsField.text?.count != 0 {
            confirmButton.isEnabled = true
        }
    }
    
    //MARK: - UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == phoneField {
            onProceedButtonClicked()
        } else {
            onConfirmButtonClicked()
        }
        return true
    }
}
