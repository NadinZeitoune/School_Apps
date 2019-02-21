//
//  ViewController.swift
//  IOS_UIGenerator
//
//  Created by hackeru on 21/02/2019.
//  Copyright © 2019 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var generator: UIGenerator!
    var label1: UILabel!
    var label2: UILabel!
    var label3: UILabel!
    var textField1: UITextField!
    var textField2: UITextField!
    var button1: UIButton!
    var button2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        generator = UIGenerator(view: view)
        generator.addMargin(margin: 40)
        
        label1 = generator.addLabel(text: "my lable 1")
        label2 = generator.addLabel(text: "my lable 2")
        button1 = generator.addButton(title: "click me 1", buttonDelegate: { (button: UIButton) in
            self.label1.text = self.textField1.text!
        })
        textField1 = generator.addTextField(placeHolder: "enter text 1...")
        generator.addMargin(margin: 30)
        textField2 = generator.addTextField(placeHolder: "enter text 2...")
        label3 = generator.addLabel(text: "my lable 3")
        button2 = generator.addButton(title: "click me 2", buttonDelegate: { (button:UIButton) in
            print("btn 2 clicked")
        })
    }
}

