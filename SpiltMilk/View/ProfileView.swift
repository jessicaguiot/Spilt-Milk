//
//  ProfileView.swift
//  SpiltMilk
//
//  Created by Jessica Guiot on 29/05/20.
//  Copyright © 2020 Hiago Chagas. All rights reserved.
//

import UIKit

class ProfileView: UIView {
    
    let profileView: UIView = {
           let view = UIView()
           view.translatesAutoresizingMaskIntoConstraints  = false
           view.layer.borderWidth                          = 1
           view.layer.cornerRadius                         = 125/2
           view.layer.borderColor                          = UIColor.lightGray.cgColor
           return view
    }()
    
    let userImageView: UIImageView  = {
        let imageView = UIImageView()
        imageView.clipsToBounds                                         = true
        imageView.translatesAutoresizingMaskIntoConstraints             = false
        return imageView
    }()
    
    let userNameLabel : UILabel = {
        
        let label                                                   = UILabel()
        
        label.text                                                  = "Jéssica Guiot"
        label.font                                                  = UIFont.systemFont(ofSize: 25)
        label.textColor                                             = .black
        label.textAlignment                                         = .center
        label.translatesAutoresizingMaskIntoConstraints             = false
        
        return label
        
    }()
    
    let emailTextFieldLabel = TextFieldsLabels()
    
    let savedEmailLabel : UILabel = {
         
        let label                                                   = UILabel()
         
        label.text                                                  = "jessica.guiot@gmail.com"
        label.font                                                  = UIFont.systemFont(ofSize: 20)
        label.textColor                                             = .black
        label.textAlignment                                         = .center
        label.translatesAutoresizingMaskIntoConstraints             = false
         
        return label
         
     }()
    
    let bottomLine = UIView()

    
    override init(frame: CGRect) {
        
        super.init(frame: .init())
        
        configureProfileView()
        configureUserNameLabel()
        configureEmailTextFieldLabel()
        configureSavedEmailLabel()
        configureBottomLine()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configureProfileView() {
        
        self.addSubview(profileView)
        profileView.addSubview(userImageView)
        
        setProfileViewConstraints()
        setUserImageViewConstraints()
    }
    
    func configureUserNameLabel() {
        
        self.addSubview(userNameLabel)
        setUserNameLabelConstraints()
    }
    
    func configureEmailTextFieldLabel() {
        
        self.addSubview(emailTextFieldLabel)
        emailTextFieldLabel.setProperties(textLabel: "Email: ")
        emailTextFieldLabel.setConstraints(self, topConstant: 300)
    }
    
    func configureSavedEmailLabel() {
        
        self.addSubview(savedEmailLabel)
        setSavedEmailLabelConstraints()
    }
    
    func configureBottomLine() {
        
        self.addSubview(bottomLine)
        bottomLine.backgroundColor                           = UIColor(red: 99/255, green: 179/255, blue: 187/255, alpha: 1.0)
        bottomLine.translatesAutoresizingMaskIntoConstraints = false
        setBottomLineConstraints()
    }
    
    func setProfileViewConstraints() {
        
        profileView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -180).isActive  = true
        profileView.centerXAnchor.constraint(equalTo: self.centerXAnchor,constant: 0).isActive      = true
        profileView.heightAnchor.constraint(equalToConstant: 125).isActive                          = true
        profileView.widthAnchor.constraint(equalToConstant: 125).isActive                           = true
    }
    
    func setUserImageViewConstraints(){
        
        userImageView.topAnchor.constraint(equalTo: profileView.topAnchor).isActive                 = true
        userImageView.bottomAnchor.constraint(equalTo: profileView.bottomAnchor).isActive           = true
        userImageView.leadingAnchor.constraint(equalTo: profileView.leadingAnchor).isActive         = true
        userImageView.trailingAnchor.constraint(equalTo: profileView.trailingAnchor).isActive       = true
    }
    
    func setUserNameLabelConstraints() {
        
        userNameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive                    = true
        userNameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -80).isActive     = true
        userNameLabel.heightAnchor.constraint(equalToConstant: 30).isActive                             = true
    }
    
    func setSavedEmailLabelConstraints() {
        
        savedEmailLabel.heightAnchor.constraint(equalToConstant: 30).isActive                             = true
        savedEmailLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 330).isActive             = true
        savedEmailLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 56).isActive      = true
        savedEmailLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -56).isActive   = true
    }
    
    func setBottomLineConstraints() {
        
        bottomLine.heightAnchor.constraint(equalToConstant: 1.0).isActive                                = true
        bottomLine.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 56).isActive          = true
        bottomLine.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -56).isActive       = true
        bottomLine.topAnchor.constraint(equalTo: self.topAnchor, constant: 360).isActive                 = true
    }
}
