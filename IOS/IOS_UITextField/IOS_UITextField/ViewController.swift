//
//  ViewController.swift
//  IOS_UITextField
//
//  Created by hackeru on 14/02/2019.
//  Copyright © 2019 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{

    var textField : UITextField!
    var button : UIButton!
    var label : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField = UITextField(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
        textField.borderStyle = .roundedRect
        textField.center = view.center
        textField.delegate = self
        view.addSubview(textField)
        
        button = UIButton(type: .system)
        button.frame = CGRect(x: textField.frame.origin.x, y: textField.frame.origin.y+80, width: textField.frame.width, height: textField.frame.height)
        button.setTitle("click me", for: .normal)
        button.addTarget(self, action: #selector(handleBtnClick(sender:)), for: .touchUpInside)
        view.addSubview(button)
        
        label = UILabel(frame: CGRect(x: textField.frame.origin.x, y: textField.frame.origin.y - 100, width: textField.frame.width, height: textField.frame.height))
        view.addSubview(label)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func handleTap(sender: UITapGestureRecognizer){
        textField.resignFirstResponder()
    }
    
    @objc func handleBtnClick(sender:UIButton){
        let s = textField.text!
        print("value is: \(s), \(s.count)")
    }
    
    // print number of characters as typing
    /*func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newS = textField.text! as NSString
        let nextS = newS.replacingCharacters(in: range, with: string)
        if nextS.count == 1 {
            label.text = "\(nextS.count) character"
        }else{
            label.text = "Characters No. : \(nextS.count)"
        }
        return true
    }*/
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newNSString = textField.text! as NSString
        let replaceNSString = string as NSString
        let futureString = newNSString.replacingCharacters(in: range, with: string)
        let c:unichar = replaceNSString.length > 0 ? replaceNSString.character(at: 0) : 0
        // if empty - allow to delete
        if c == 0 {return true}
        // make sure new string is number
        if c <= 57 && c >= 48 || c == 46{
            if futureString.count == 2{
                // if second is .
                let futureAsNS = futureString as NSString
                let firstC = futureAsNS.character(at: 0)
                if firstC == 48 {
                    if c == 46{return true}
                }else{return true}
            }else{
                // anything else differant from .
                if c != 46{return true}
            }
        }
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

