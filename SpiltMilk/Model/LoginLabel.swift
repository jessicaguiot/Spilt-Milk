//
//  LoginLabel.swift
//  SpiltMilk
//
//  Created by Jessica Guiot on 27/05/20.
//  Copyright © 2020 Hiago Chagas. All rights reserved.
//

import UIKit

class LoginLabel: UILabel {

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func setProperties(textLabel:String){
        
        self.text                                                          = textLabel
        self.textColor                                                     = .black
        self.font                                                          = UIFont.systemFont(ofSize: 20)
        self.textAlignment                                                 = .left
        self.translatesAutoresizingMaskIntoConstraints                     = false
    }
    
    func setConstraints(_ view: UIView, topConstant: CGFloat){
        
        self.heightAnchor.constraint(equalToConstant: 20).isActive                                                  = true
        self.topAnchor.constraint(equalTo: view.topAnchor, constant: topConstant).isActive                          = true
        self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 56).isActive                           = true
        self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -56).isActive                        = true
    }
    
}
