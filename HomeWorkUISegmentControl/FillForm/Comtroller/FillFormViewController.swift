//
//  FillFor,.swift
//  HomeWorkUISegmentControl
//
//  Created by Nikita Moskalenko on 2/16/20.
//  Copyright © 2020 Nikita Moskalenko. All rights reserved.
//

import UIKit

final class FillFormViewController: UIViewController {
    
    // MARK: - Private properties
    
    private let nameTextField = UITextField()
    private let emailTextFIeld = UITextField()
    private let phoneTextFied = UITextField()
    private let sendButton = UIButton()
    
    // MARK: - Constants
    
    enum textForFillFormViewController {
        case namePlaceHolder
        case emailTextField
        case phoneTextFied
        case sendButton
        
        var text: String {
            switch self {
            case .sendButton:
                return "Send"
            case .phoneTextFied:
                return "Enter ypur phone"
            case .emailTextField:
                return "Enter your e-mail"
            case .namePlaceHolder:
                return "Enter your name"
            }
        }
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSettingForNameTextField()
        addSettingForEmailTextField()
        addSettingForPhoneTextField()
        addSettingForSendButton()
        addSettingForView()
    }
    
    // MARK: - Private methods
    
    private func addSettingForView() {
        view.backgroundColor = .white
    }
    
    private func addSettingForNameTextField() {
        nameTextField.frame = CGRect(x: 150, y: 150, width: 200, height: 40)
        nameTextField.placeholder = textForFillFormViewController.namePlaceHolder.text
        nameTextField.backgroundColor = .darkGray
        nameTextField.textColor = .green
        
        view.addSubview(nameTextField)
    }
    
    private func addSettingForEmailTextField() {
        emailTextFIeld.frame = CGRect(x: 150, y: 220, width: 200, height: 40)
        emailTextFIeld.placeholder = textForFillFormViewController.emailTextField.text
        emailTextFIeld.backgroundColor = .darkGray
        emailTextFIeld.textColor = .green
        
        view.addSubview(emailTextFIeld)
    }
    
    private func addSettingForPhoneTextField() {
        phoneTextFied.frame = CGRect(x: 150, y: 290, width: 200, height: 40)
        phoneTextFied.placeholder = textForFillFormViewController.phoneTextFied.text
        phoneTextFied.backgroundColor = .darkGray
        phoneTextFied.textColor = .green
        
        view.addSubview(phoneTextFied)
    }
    
    private func addSettingForSendButton() {
        sendButton.frame = CGRect(x: 80, y: 750, width: 250, height: 50)
        sendButton.setTitle(textForFillFormViewController.sendButton.text, for: .normal)
        sendButton.setTitleColor(.green, for: .normal)
        sendButton.backgroundColor = .darkGray
        sendButton.addTarget(self, action: #selector(sendData), for: .touchUpInside)
        

        view.addSubview(sendButton)
    }
    
    @objc
    private func sendData() {
        let comeBackToShop = BasketViewController()
        comeBackToShop.modalPresentationStyle = .fullScreen
//      present(comeBackToShop, animated: true)
        
        
    }
}
