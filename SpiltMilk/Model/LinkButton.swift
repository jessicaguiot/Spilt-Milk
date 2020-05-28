//
//  LinkButton.swift
//  SpiltMilk
//
//  Created by Jessica Guiot on 28/05/20.
//  Copyright © 2020 Hiago Chagas. All rights reserved.
//

import UIKit

class LinkButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setUpButton(titleButton: String) {
        
        self.translatesAutoresizingMaskIntoConstraints  = false
        self.titleLabel?.font         = UIFont.italicSystemFont(ofSize: 16)
        self.setTitle(titleButton, for: .normal)
        self.setTitleColor(UIColor(red: 76/255, green: 76/255, blue: 76/255, alpha: 1.0), for: .normal)
    }
    
    func setUpConstraints(_ view: UIView, topConstant: CGFloat ,bottomConstant: CGFloat) {
        
        self.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive                         = true
        self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: bottomConstant).isActive = true
        self.topAnchor.constraint(equalTo: view.topAnchor, constant: topConstant).isActive                  = true
    }
}
