//
//  BottomLineTextField.swift
//  SpiltMilk
//
//  Created by Jessica Guiot on 27/05/20.
//  Copyright © 2020 Hiago Chagas. All rights reserved.
//

import UIKit

class BottomLineTextField: UITextField{

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setProperties()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setProperties()
    }
    
    func setProperties() {
        self.borderStyle                                    = .none
        self.translatesAutoresizingMaskIntoConstraints      = false
        self.underlined()
    }
    
    func underlined() {
        
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: 25, width: 263, height: 1.0)
        bottomLine.backgroundColor = UIColor(red: 99/255, green: 179/255, blue: 187/255, alpha: 1.0).cgColor
        self.layer.addSublayer(bottomLine)
    }
    
    func setConstraints(_ view: UIView, topConstant: CGFloat){
        
        self.topAnchor.constraint(equalTo: view.topAnchor, constant: topConstant).isActive              = true
        self.widthAnchor.constraint(equalToConstant: 263).isActive                                      = true
        self.heightAnchor.constraint(equalToConstant: 30).isActive                                      = true
        self.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive                             = true
    }
}
