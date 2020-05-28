//
//  DefaultButton.swift
//  SpiltMilk
//
//  Created by Jessica Guiot on 28/05/20.
//  Copyright © 2020 Hiago Chagas. All rights reserved.
//

import UIKit

class DefaultButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setUpButton(titleButton: String) {
        
        self.translatesAutoresizingMaskIntoConstraints                          = false
        self.titleLabel?.font                                                   = UIFont.init(name: "SF Pro Display", size: 18)
        self.setTitle(titleButton, for: .normal)
        self.setTitleColor(.white, for: .normal)
        self.backgroundColor                                                    = UIColor(red: 99/255, green: 179/255, blue: 187/255, alpha: 1.0)
        self.layer.cornerRadius                                                 = 18
    }
    
    func setUpConstraints(_ view: UIView, topConstant: CGFloat, bottomConstant: CGFloat) {
        
        self.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive                                 = true
        self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: bottomConstant).isActive         = true
        self.topAnchor.constraint(equalTo: view.topAnchor, constant: topConstant).isActive                  = true
        self.widthAnchor.constraint(equalToConstant: 127).isActive                                          = true
        
    }
}
