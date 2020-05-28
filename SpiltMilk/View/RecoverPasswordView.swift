//
//  RecoverPasswordView.swift
//  SpiltMilk
//
//  Created by Jhennyfer Rodrigues de Oliveira on 21/05/20.
//  Copyright © 2020 Hiago Chagas. All rights reserved.
//

import UIKit

class RecoverPasswordView: UIView {
    
    
    var shouldSetupConstraints = true
    
    let textField = UITextField()
    let logoTitle = UILabel()
    let sendEmailButton = UIButton()
    let logoImage = UIImageView()
    let emailLabel = UILabel()

    func setUpElements(){
        
        logoImage.image = UIImage(named: "Vaquinha")
        
        sendEmailButton.setTitle("Send Email", for: .normal)
        sendEmailButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        sendEmailButton.backgroundColor = #colorLiteral(red: 0.3882352941, green: 0.7019607843, blue: 0.7333333333, alpha: 1)
        sendEmailButton.layer.cornerRadius = 20
 
        logoTitle.text = "Spilt Milk"
        logoTitle.font = UIFont.systemFont(ofSize: 32)
        logoTitle.textColor = .black
        
        emailLabel.text = "E-mail"
        emailLabel.textColor = .black
        emailLabel.font = UIFont.systemFont(ofSize: 18)
    }
    
    func customTextField() {
        let textFieldColor = UIColor(red: 0.0, green: 131.0/255.0, blue: 143.0/255.0, alpha: 1)
        let bottomLine = CALayer()
        textField.attributedPlaceholder = .init(string: "username@xxxx.com")
        bottomLine.frame = CGRect(x: 0, y: 50, width: 250, height: 1.0)
        bottomLine.backgroundColor = textFieldColor.cgColor
        textField.borderStyle = .none
        textField.layer.addSublayer(bottomLine)
    }
    
    
    func setLogoTitleConstraints(){
        logoTitle.translatesAutoresizingMaskIntoConstraints = false
        
        logoTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        logoTitle.topAnchor.constraint(equalTo: logoImage.topAnchor, constant: 130).isActive =  true
        logoTitle.widthAnchor.constraint(equalToConstant: 130).isActive = true
        logoTitle.heightAnchor.constraint(equalToConstant: 70 ).isActive = true
        
    }
    
    func setLogoImageConstraints(){
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        logoImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 80).isActive =  true
        logoImage.widthAnchor.constraint(equalToConstant: 180).isActive = true
        logoImage.heightAnchor.constraint(equalToConstant: 140).isActive = true
        
    }
    
    func setEmailLabelConstraints(){
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.topAnchor.constraint(equalTo: logoTitle.topAnchor, constant: 70).isActive = true
        emailLabel.leftAnchor.constraint(equalToSystemSpacingAfter: self.leftAnchor, multiplier: 8).isActive = true
        emailLabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
        emailLabel.heightAnchor.constraint(equalToConstant: 70 ).isActive = true
    }
    
    func setTextFieldConstraints(){
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.leftAnchor.constraint(equalToSystemSpacingAfter: self.leftAnchor, multiplier: 8).isActive = true
        textField.topAnchor.constraint(equalTo: emailLabel.topAnchor, constant: 40).isActive =  true
        textField.widthAnchor.constraint(equalToConstant: 250).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 70 ).isActive = true
    }
    
    func setSendEmailButtonConstraints(){
        sendEmailButton.translatesAutoresizingMaskIntoConstraints = false
        sendEmailButton.topAnchor.constraint(equalTo: textField.topAnchor, constant: 70).isActive = true
        sendEmailButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        sendEmailButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
        sendEmailButton.heightAnchor.constraint(equalToConstant: 40).isActive = true

    }
    
    override init(frame: CGRect) {
        super.init(frame: .init())
        setUpElements()
        
        //add elements to this view (self = RecoverPasswordView)
        self.addSubview(logoImage)
        self.addSubview(logoTitle)
        self.addSubview(textField)
        self.addSubview(emailLabel)
        self.addSubview(sendEmailButton)
        
        customTextField()
        setLogoImageConstraints()
        setLogoTitleConstraints()
        setTextFieldConstraints()
        setEmailLabelConstraints()
        setSendEmailButtonConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
