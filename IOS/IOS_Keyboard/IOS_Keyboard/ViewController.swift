//
//  ViewController.swift
//  IOS_Keyboard
//
//  Created by hackeru on 14/02/2019.
//  Copyright © 2019 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var textField : UITextField!
    var howMuchToLiftUp: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField = UITextField(frame: CGRect(x: 100, y: 500, width: view.frame.width-200, height: 30))
        textField.borderStyle = .roundedRect
        textField.placeholder = "type...."
        view.addSubview(textField)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }

    @objc func handleKeyboardWillShow(notification: NSNotification){
        print("keyboard did show")
        let frame = notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! CGRect
        howMuchToLiftUp = textField.frame.maxY - frame.minY + 5
        view.frame.origin.y -= howMuchToLiftUp
    }
    @objc func handleKeyboardWillHide(notification: NSNotification){
        print("keyboard did hide")
        view.frame.origin.y += howMuchToLiftUp
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

