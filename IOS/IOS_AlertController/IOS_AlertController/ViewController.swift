//
//  ViewController.swift
//  IOS_AlertController
//
//  Created by hackeru on 07/02/2019.
//  Copyright © 2019 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(_ animated: Bool) {
        super .viewDidAppear(animated)
        
        let alertController=UIAlertController(title: "title", message: "massage", preferredStyle: .alert)
        
        alertController.addTextField { (textField:UITextField) in
            textField.placeholder = "your name"
        }
        
        let action = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
            print("ok button clicked")
            let textField = alertController.textFields![0]
            print("your name is \(textField.text!)")
        }
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }


}







