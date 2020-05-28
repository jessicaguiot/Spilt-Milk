//
//  LoginViewController.swift
//  SpiltMilk
//
//  Created by Jessica Guiot on 27/05/20.
//  Copyright © 2020 Hiago Chagas. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    let logoImageView :  UIImageView = {
        let imageView                                           = UIImageView()
        
        imageView.image                                         = UIImage(named: "logo")
        imageView.translatesAutoresizingMaskIntoConstraints     = false
        
        return imageView
    }()
    
    let nomeAplicativoLabel : UILabel = {
        
        let label                                           = UILabel()
        
        label.text                                          = "Spilt Milk"
        label.font                                          = UIFont.systemFont(ofSize: 30)
        label.textColor                                     = .black
        label.textAlignment                                 = .center
        label.translatesAutoresizingMaskIntoConstraints     = false
        return label
        
    }()
    
    var loginLabels: UILabel  {
        
        let label                                                           = UILabel()
        label.text                                                          = "default"
        label.textColor                                                     = .black
        label.font                                                          = UIFont.systemFont(ofSize: 20)
        label.textAlignment                                                 = .left
        label.translatesAutoresizingMaskIntoConstraints                     = false
        label.heightAnchor.constraint(equalToConstant: 20).isActive         = true
        return label
    }
    
    
    let emailLabel              = LoginLabel()
    let passwordLabel           = LoginLabel()
    
    let emailTextField          = BottomLineTextField()
    let passwordTextField       = BottomLineTextField()
    
    let recoverPasswordButton   = LinkButton()
    let createAccountButton     = LinkButton()
    
    let loginButton             = DefaultButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        //Delegates
        setTextFieldDelegate()
        
        
        //Set Ups
        configureNavigationBar()
        configureLogoImageView()
        configureNomeAplicativoLabel()
        configureLoginForm()
        configureLinksButtons()
        configureLoginButton()
    }
    
    func configureNavigationBar(){
        
        self.navigationItem.title = "Login"
        navigationController?.navigationBar.barTintColor = UIColor(red: 0.62, green: 0.96, blue: 0.94, alpha: 1.00)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Pular", style: .plain, target: nil, action: nil)
    }
    
    func configureLogoImageView(){
        
        view.addSubview(logoImageView)
        setLogoImageViewConstraints()
    }
    
    func configureNomeAplicativoLabel(){
        
        view.addSubview(nomeAplicativoLabel)
        setNomeAplicativoLabelConstraints()
    }
    
    func configureLoginForm(){
        
        view.addSubview(emailLabel)
        emailLabel.setProperties(textLabel: "Email")
        emailLabel.setConstraints(view, topConstant: 310)
        
        
        view.addSubview(emailTextField)
        emailTextField.setConstraints(view, topConstant: 339)
        
        view.addSubview(passwordLabel)
        passwordLabel.setProperties(textLabel: "Senha")
        passwordLabel.setConstraints(view, topConstant: 394)
        
        view.addSubview(passwordTextField)
        passwordTextField.setConstraints(view, topConstant: 423)
        
    }
    
    func configureLinksButtons() {
        
        view.addSubview(recoverPasswordButton)
        recoverPasswordButton.setUpButton(titleButton: "Esqueceu sua senha?")
        recoverPasswordButton.setUpConstraints(view, topConstant: 460, bottomConstant: -163)
        
        view.addSubview(createAccountButton)
        createAccountButton.setUpButton(titleButton: "Criar uma nova conta")
        createAccountButton.setUpConstraints(view, topConstant: 570, bottomConstant: -87)
    }
    
    func configureLoginButton() {
        
        view.addSubview(loginButton)
        loginButton.setUpButton(titleButton: "Login")
        loginButton.setUpConstraints(view, topConstant: 510, bottomConstant: -117)
    }
    
    
    func setLogoImageViewConstraints(){
        
        logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 116).isActive         = true
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive                = true
        logoImageView.heightAnchor.constraint(equalToConstant:  115).isActive                       = true
        logoImageView.widthAnchor.constraint(equalToConstant: 146).isActive                         = true
    }
    
    func  setNomeAplicativoLabelConstraints() {
        
        nomeAplicativoLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 15).isActive                = true
        nomeAplicativoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive                                  = true
        nomeAplicativoLabel.heightAnchor.constraint(equalToConstant: 40).isActive                                           = true
    }
    
    
    
}

extension LoginViewController: UITextFieldDelegate {
    
    func setTextFieldDelegate() {
        
        emailTextField.delegate                 = self
        passwordTextField.delegate              = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // cause the textfield that currently has focus to release focus and the keyboard will hide
        textField.resignFirstResponder()
        return true
    }
    
}
