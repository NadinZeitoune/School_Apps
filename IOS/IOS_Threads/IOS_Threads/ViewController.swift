//
//  ViewController.swift
//  IOS_Threads
//
//  Created by hackeru on 21/02/2019.
//  Copyright © 2019 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var label: UILabel!
    var textField: UITextField!
    var button: UIButton!
    var generator: UIGenerator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        generator = UIGenerator(view: view)
        generator.addMargin(margin: 80)
        label = generator.addLabel(text: "some label")
        textField = generator.addTextField(placeHolder: "type something")
        button = generator.addButton(title: "click me", buttonDelegate: { (sener: UIButton) in
            var x = 0
            DispatchQueue.global().async {
                for i in 0 ..< 100000000{
                    if i % 3 == 0{
                        x+=i
                    }else{
                        x+=1
                    }
                }
                DispatchQueue.main.async {
                    self.label.text = String(x)
                }
            }
        })
    }
}

