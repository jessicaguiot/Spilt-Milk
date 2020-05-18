//
//  AddPostViewController.swift
//  Bookshelf
//
//  Created by Hiago Chagas on 17/05/20.
//  Copyright © 2020 Hiago Chagas. All rights reserved.
//

import UIKit

class AddPostViewController: UIViewController {
    //let safeArea : UILayoutGuide!
    var textField: UITextField = {
        var txt = UITextField()
        return txt
    }()
    override func viewDidLoad() {
        print("wj")
        super.viewDidLoad()
        view.backgroundColor = .red
        self.view.addSubview(textField)
//        textField.translatesAutoresizingMaskIntoConstraints = false
//        textField.topAnchor.constraint(equalTo: self.safeArea.topAnchor, constant: 30).isActive = true
//        textField.leftAnchor.constraint(equalTo: self.safeArea.leftAnchor, constant: 10).isActive = true
//        textField.rightAnchor.constraint(equalTo: self.safeArea.rightAnchor, constant: 10).isActive = true
//
    }

}
