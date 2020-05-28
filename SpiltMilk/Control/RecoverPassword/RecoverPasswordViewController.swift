//
//  RecoverPasswordViewController.swift
//  SpiltMilk
//
//  Created by Jhennyfer Rodrigues de Oliveira on 21/05/20.
//  Copyright © 2020 Hiago Chagas. All rights reserved.
//

import UIKit

class RecoverPasswordViewController: UIViewController, UITextFieldDelegate {
    var recoverView = RecoverPasswordView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recoverView.textField.delegate = self
        view = recoverView
        view.backgroundColor = .white
        
        //quando o botão for clicado direcionar o user pra tela de login
        recoverView.sendEmailButton.addTarget(self, action:  #selector(whenButtonClickedGoToLoginScreen), for: .touchUpInside)
        
        // Rolar a view para cima quando for digitar e para baixo quando clicar fora do text field
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil);
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil);
        
        //Adicionando gesture para o teclado sair
        self.hideKeyboardWhenTappedAround()
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(RecoverPasswordViewController.dismissKeyboard)))
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    //MARK: - Métodos
    
    @objc func whenButtonClickedGoToLoginScreen(){
        print("tela de login")
//        let newViewController = NewViewController()
//        self.navigationController?.pushViewController(newViewController, animated: true)
    }
    
    @objc func keyboardWillShow(sender: NSNotification){
        self.view.frame.origin.y = -95
    }
    
    @objc func keyboardWillHide(sender: NSNotification){
        self.view.frame.origin.y = 0
    }
    
    func hideKeyboardWhenTappedAround(){
        let tap : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(RecoverPasswordViewController.dismissKeyboard))
        
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard(){
        self.view.endEditing(true)
    }
    
    //MARK: - Text Field Delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    
}
