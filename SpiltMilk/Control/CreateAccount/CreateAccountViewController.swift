//
//  CreateAccountViewController.swift
//  SpiltMilk
//
//  Created by Jessica Guiot on 28/05/20.
//  Copyright © 2020 Hiago Chagas. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {
    
    let createAccountView = CreateAccountView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpCreateAccountView()
        configureNavBar()
        
    }
    
    func setUpCreateAccountView() {
        
        view = createAccountView
        view.backgroundColor = .white
    }
    
    func configureNavBar() {
        self.navigationItem.title = "Criar Conta"
        navigationController?.navigationBar.barTintColor = UIColor(red: 0.62, green: 0.96, blue: 0.94, alpha: 1.00)
    }

}
