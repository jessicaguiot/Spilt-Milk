//
//  EditProfileViewController.swift
//  SpiltMilk
//
//  Created by Jessica Guiot on 29/05/20.
//  Copyright © 2020 Hiago Chagas. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController {
    
    let editProfileView = EditProfileView()
    let profileView = ProfileView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view = editProfileView
        view.backgroundColor = .white
        
        configureNavBar()
        
        setTextFieldsDelegate()
    }
    

    func configureNavBar() {
        
        self.navigationItem.title = "Editar Perfil"
        navigationController?.navigationBar.barTintColor = UIColor(red: 0.62, green: 0.96, blue: 0.94, alpha: 1.00)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Salvar", style: .plain, target: self, action: #selector(salveData))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancelar", style: .plain, target: self, action: #selector(popView))
    }
       
    func setTextFieldsDelegate() {
    
        editProfileView.nameTextField.delegate              = self
        editProfileView.emailTextField.delegate             = self
        editProfileView.passwordTextField.delegate          = self
        editProfileView.repeatPasswordTextField.delegate    = self
    }
    
    
    
    @objc func salveData() {
        
        let profileViewController = ProfileViewController()
        
        guard let nameUser =  editProfileView.nameTextField.text, let emailUser = editProfileView.emailTextField.text else { return }
               
        profileViewController.profileView.userNameLabel.text    = nameUser
        profileViewController.profileView.savedEmailLabel.text  = emailUser
    
        navigationController?.pushViewController(profileViewController, animated: true)
    }
    
    @objc func popView() {
       
           navigationController?.popViewController(animated: true)
       }
}

extension EditProfileViewController: UITextFieldDelegate {
    
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
        
        self.view.frame.origin.y = -80
    }
    
    @objc func keyboardWillHide(){
        
        self.view.frame.origin.y = 0
    }
    
}
