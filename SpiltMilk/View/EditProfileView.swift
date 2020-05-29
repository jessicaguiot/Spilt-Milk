//
//  EditProfileView.swift
//  SpiltMilk
//
//  Created by Jessica Guiot on 29/05/20.
//  Copyright © 2020 Hiago Chagas. All rights reserved.
//

import UIKit

class EditProfileView: UIView {
    
    let profileView: UIView = {
           let view = UIView()
           view.translatesAutoresizingMaskIntoConstraints  = false
           view.layer.borderWidth                          = 1
           view.layer.cornerRadius                         = 125/2
           view.layer.borderColor                          = UIColor.lightGray.cgColor
           return view
    }()
    
    let imageView: UIImageView  = {
        let imageView = UIImageView()
        imageView.clipsToBounds                                         = true
        imageView.translatesAutoresizingMaskIntoConstraints             = false
        return imageView
    }()
    
    let pickerImageButton: UIButton = {
        let button = UIButton()
        button.setTitle("Foto", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    let stackView = UIStackView()
    
    var profileLabel: UILabel  {
        let label = UILabel()
        label.text = "default"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalToConstant: 20).isActive = true
        return label
    }
    
    
    let nameTextField                   = BottomLineTextField()
    let emailTextField                  = BottomLineTextField()
    let passwordTextField               = BottomLineTextField()
    let repeatPasswordTextField         = BottomLineTextField()
    
   override init(frame: CGRect) {
        
        super.init(frame: .init())
    
        configureProfileView()
        configureStackView()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    func configureProfileView(){
        self.addSubview(profileView)
        
        profileView.addSubview(imageView)
        profileView.addSubview(pickerImageButton)
        
        setProfileViewConstraints()
        setImageViewConstraints()
        setPickerImageButtonConstraints()
    }
    
    func configureStackView(){
           self.addSubview(stackView)
           
           stackView.axis = .vertical
           stackView.spacing = 15
           stackView.distribution = .fill
           
           setStackViewConstraints()
           addElementsToStackView()
    }
    
    func addElementsToStackView(){
        
        let nameLabel = profileLabel
        nameLabel.text = "Nome: "
        stackView.addArrangedSubview(nameLabel)
        
        stackView.addArrangedSubview(nameTextField)
        
        let emailLabel = profileLabel
        emailLabel.text = "Email: "
        stackView.addArrangedSubview(emailLabel)
        
        stackView.addArrangedSubview(emailTextField)
        
        let passwordLabel = profileLabel
        passwordLabel.text = "Nova Senha: "
        stackView.addArrangedSubview(passwordLabel)
        
        //password style text field
        passwordTextField.isSecureTextEntry = true
        stackView.addArrangedSubview(passwordTextField)
        
        let repeatNewPassword = profileLabel
        repeatNewPassword.text = "Confirmar Nova Senha: "
        stackView.addArrangedSubview(repeatNewPassword)
        
        repeatPasswordTextField.isSecureTextEntry = true
        stackView.addArrangedSubview(repeatPasswordTextField)
    }
    
    func setProfileViewConstraints(){
        profileView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -180).isActive  = true
        profileView.centerXAnchor.constraint(equalTo: self.centerXAnchor,constant: 0).isActive      = true
        profileView.heightAnchor.constraint(equalToConstant: 125).isActive                          = true
        profileView.widthAnchor.constraint(equalToConstant: 125).isActive                           = true
    }

    func setImageViewConstraints(){
        imageView.topAnchor.constraint(equalTo: profileView.topAnchor).isActive                 = true
        imageView.bottomAnchor.constraint(equalTo: profileView.bottomAnchor).isActive           = true
        imageView.leadingAnchor.constraint(equalTo: profileView.leadingAnchor).isActive         = true
        imageView.trailingAnchor.constraint(equalTo: profileView.trailingAnchor).isActive       = true
    }
    
    func setPickerImageButtonConstraints() {
        
        pickerImageButton.centerXAnchor.constraint(equalTo: profileView.centerXAnchor).isActive     = true
        pickerImageButton.centerYAnchor.constraint(equalTo: profileView.centerYAnchor).isActive     = true
        pickerImageButton.heightAnchor.constraint(equalToConstant: 20).isActive                     = true
    }
    
    func setStackViewConstraints() {
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 40).isActive       = true
        stackView.topAnchor.constraint(equalTo: profileView.bottomAnchor, constant: 20).isActive    = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40).isActive   = true
    }
}
