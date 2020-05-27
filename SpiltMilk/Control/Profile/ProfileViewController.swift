//
//  ProfileViewController.swift
//  Bookshelf
//
//  Created by Hiago Chagas on 15/05/20.
//  Copyright © 2020 Hiago Chagas. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
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
    
    var profileTextField: UITextField {
        
        let textField = UITextField()
        textField.borderStyle = .none
        textField.underlined()
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.heightAnchor.constraint(equalToConstant: 20).isActive = true
        return textField
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configureNavBar()
        configureProfileView()
        configureStackView()
        
    }
    
    func configureNavBar() {
        self.navigationItem.title = "Perfil"
        navigationController?.navigationBar.barTintColor = UIColor(red: 0.62, green: 0.96, blue: 0.94, alpha: 1.00)
    }
    
    func configureProfileView(){
        view.addSubview(profileView)
        
        profileView.addSubview(imageView)
        profileView.addSubview(pickerImageButton)
        
        setProfileViewConstraints()
        setImageViewConstraints()
        setPickerImageButtonConstraints()
    }
    
    func configureStackView(){
        view.addSubview(stackView)
        
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fill
        
        setStackViewConstraints()
        addElementsToStackView()
    }
    
    func addElementsToStackView(){
        
        let nameLabel = profileLabel
        nameLabel.text = "Nome"
        stackView.addArrangedSubview(nameLabel)
        
        let nameTextField = profileTextField
        stackView.addArrangedSubview(nameTextField)
        
        let emailLabel = profileLabel
        emailLabel.text = "Email"
        stackView.addArrangedSubview(emailLabel)
        
        let emailTextField = profileTextField
        stackView.addArrangedSubview(emailTextField)
        
        let passwordLabel = profileLabel
        passwordLabel.text = "Senha"
        stackView.addArrangedSubview(passwordLabel)
        
        let passwordTextField = profileTextField
        //password style text field
        passwordTextField.isSecureTextEntry = true
        stackView.addArrangedSubview(passwordTextField)
    }
    

    func setProfileViewConstraints(){
        profileView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -180).isActive = true
        profileView.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: 0).isActive = true
        profileView.heightAnchor.constraint(equalToConstant: 125).isActive = true
        profileView.widthAnchor.constraint(equalToConstant: 125).isActive = true
    }

    func setImageViewConstraints(){
        imageView.topAnchor.constraint(equalTo: profileView.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: profileView.bottomAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: profileView.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: profileView.trailingAnchor).isActive = true
    }
    
    func setPickerImageButtonConstraints(){
        pickerImageButton.centerXAnchor.constraint(equalTo: profileView.centerXAnchor).isActive = true
        pickerImageButton.centerYAnchor.constraint(equalTo: profileView.centerYAnchor).isActive = true
        pickerImageButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    func setStackViewConstraints(){
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 40).isActive = true
        stackView.topAnchor.constraint(equalTo: profileView.bottomAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
    }
    
    
}

extension ProfileViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        configureNotificationKeyboard()
    }
    
    func configureNotificationKeyboard(){
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:UIResponder.keyboardWillShowNotification, object: nil);
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(){
        self.view.frame.origin.y = -100
    }
    
    @objc func keyboardWillHide(){
        self.view.frame.origin.y = 0
    }
    
}


extension UITextField {
    
    func underlined(){
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: 25, width: 300, height: 1.0)
        bottomLine.backgroundColor = UIColor.black.cgColor
        self.layer.addSublayer(bottomLine)
    }
    
}
