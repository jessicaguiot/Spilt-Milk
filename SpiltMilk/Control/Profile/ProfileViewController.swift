//
//  ProfileViewController.swift
//  Bookshelf
//
//  Created by Hiago Chagas on 15/05/20.
//  Copyright © 2020 Hiago Chagas. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let profileView = ProfileView()

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        configureView()
        configureNavBar()
        
    }
    
    func configureView() {
        view = profileView
        view.backgroundColor = .white
    }
    
    func configureNavBar() {
        
        self.navigationItem.title = "Perfil"
        navigationController?.navigationBar.barTintColor = UIColor(red: 0.62, green: 0.96, blue: 0.94, alpha: 1.00)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(showEditProfileView))
    }
   
    @objc func showEditProfileView() {
        navigationController?.pushViewController(EditProfileViewController(), animated: true)
    }
    
}




