//
//  CreateAccountView.swift
//  SpiltMilk
//
//  Created by Jessica Guiot on 28/05/20.
//  Copyright © 2020 Hiago Chagas. All rights reserved.
//

import UIKit

class CreateAccountView: UIView {
    
    let pickerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints  = false
        view.layer.borderWidth                          = 1
        view.layer.cornerRadius                         = 125/2
        view.layer.borderColor                          = UIColor.lightGray.cgColor
        return view
    }()
    
    let largeConfig = UIImage.SymbolConfiguration(pointSize: 40, weight: .bold, scale: .large)
    
    let pickerViewButton: UIButton = {
        let button = UIButton()
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let stackView = UIStackView()
    
    let nameLabel                       = TextFieldsLabels()
    let emailLabel                      = TextFieldsLabels()
    let passwordLabel                   = TextFieldsLabels()
    let repeatPasswordLabel             = TextFieldsLabels()
    
    let nameTextField                   = BottomLineTextField()
    let emailTexField                   = BottomLineTextField()
    let passwordTextField               = BottomLineTextField()
    let repeatPasswordTextField         = BottomLineTextField()
    
    let signUpButton                    = DefaultButton()
    
     override init(frame: CGRect) {
        
        super.init(frame: .init())
        
        configurePickerView()
        configurePickerViewButton()
        configureStackView()
        configureSignUpButton()
    }
        
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configurePickerView() {
        self.addSubview(pickerView)
        setPickerViewConstraints()
    }
    
    func configurePickerViewButton() {
        
        let largeBoldCamera = UIImage(systemName: "camera.fill", withConfiguration: largeConfig)
        
        pickerView.addSubview(pickerViewButton)
        pickerViewButton.setImage(largeBoldCamera, for: .normal)
        setPickerViewButtonConstraints()
    }

    
    func configureStackView() {
        self.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.distribution = .fillEqually
        
        setStackViewConstraints()
        addElementsToStackView()
    }
    
    func configureSignUpButton() {
        
        self.addSubview(signUpButton)
        signUpButton.setUpButton(titleButton: "Criar Conta")
        signUpButton.setUpConstraints(self, topConstant: 560, bottomConstant: -71)
    }
    
    func addElementsToStackView() {
        
        stackView.addArrangedSubview(nameLabel)
        nameLabel.setProperties(textLabel: "Nome")
        
        stackView.addArrangedSubview(nameTextField)
        
        stackView.addArrangedSubview(emailLabel)
        emailLabel.setProperties(textLabel: "Email")
        
        stackView.addArrangedSubview(emailTexField)
        
        stackView.addArrangedSubview(passwordLabel)
        passwordLabel.setProperties(textLabel: "Senha")
        
        stackView.addArrangedSubview(passwordTextField)
        
        stackView.addArrangedSubview(repeatPasswordLabel)
        repeatPasswordLabel.setProperties(textLabel: "Repetir a senha")
        
        stackView.addArrangedSubview(repeatPasswordTextField)
        
        
    }
    
    func setStackViewConstraints() {
        
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 56).isActive                      = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -56).isActive                   = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -134).isActive                      = true
        stackView.topAnchor.constraint(equalTo: pickerView.bottomAnchor, constant: 20).isActive                     = true
    }
    
    
    func setPickerViewConstraints() {
        
        pickerView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive                              = true
        pickerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 106).isActive                       = true
        pickerView.heightAnchor.constraint(equalToConstant: 125).isActive                                      = true
        pickerView.widthAnchor.constraint(equalToConstant: 125).isActive                                       = true
    }
    
    func setPickerViewButtonConstraints() {
        
        pickerViewButton.centerXAnchor.constraint(equalTo: pickerView.centerXAnchor).isActive                  = true
        pickerViewButton.centerYAnchor.constraint(equalTo: pickerView.centerYAnchor).isActive                  = true
        pickerViewButton.heightAnchor.constraint(equalToConstant: 60).isActive                                = true
    }
}
