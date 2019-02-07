//
//  ViewController.swift
//  IOS_exe_Alert
//
//  Created by hackeru on 07/02/2019.
//  Copyright © 2019 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var btnLogin : UIButton!
    var btnSignUp : UIButton!
    var userName : String!
    var password : String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnLogin = UIButton(frame: CGRect(x: 0, y: 0, width: 120, height: 30))
        btnLogin.center = view.center
        btnLogin.setTitleColor(UIColor.black, for: .normal)
        btnLogin.setTitle("Login", for: .normal)
        btnLogin.addTarget(self, action: #selector(btnLoginClicked(sender:)), for: .touchUpInside)
        view.addSubview(btnLogin)
        
        btnSignUp = UIButton(frame: CGRect(x: btnLogin.frame.origin.x, y: btnLogin.frame.maxY, width: 120, height: 30))
        btnSignUp.setTitle("SignUp", for: .normal)
        btnSignUp.setTitleColor(UIColor.black, for: .normal)
        btnSignUp.addTarget(self, action: #selector(btnSignUpClicked(sender:)), for: .touchUpInside)
        view.addSubview(btnSignUp)
    }

    override func viewDidAppear(_ animated: Bool) {
        super .viewDidAppear(animated)
    }

    @objc func btnLoginClicked(sender: UIButton){
        openUsernameAlert()
        
        if checkFields() {
            print("\(userName), \(password)")
        }
    }
    
    @objc func btnSignUpClicked(sender: UIButton){
        openUsernameAlert()
        
        if checkFields() {
            print("\(userName), \(password)")
        }
        
    }
    
    func checkFields() -> Bool {
        if (userName != nil && userName!.count >= 0) && (password != nil && password!.count >= 0){
            return true
        }
        return false
    }
    
    func openEmptyAlert(_ alert : UIAlertController){
        let emptyAlert = UIAlertController(title: "Error!", message: "text field is empty", preferredStyle: .alert)
        let actionOK = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
            self.present(alert, animated: true, completion: nil)
        }
        emptyAlert.addAction(actionOK)
        present(emptyAlert, animated: true, completion: nil)
    }
    
    func openUsernameAlert(){
        let usernameAlert = UIAlertController(title: "Enter username", message: "", preferredStyle: .alert)
        
        usernameAlert.addTextField { (textField:UITextField) in
            textField.placeholder = "user name"
        }
        
        let actionNext = UIAlertAction(title: "Next", style: .default) { (action:UIAlertAction) in
            let textField = usernameAlert.textFields![0]
            if textField.text?.count == 0{
                self.openEmptyAlert(usernameAlert)
                return
            }
            self.userName = textField.text
            
            self.openPasswordAlert()
        }
        let actionCancle = UIAlertAction(title: "cancle", style: .cancel) { (action:UIAlertAction) in}
        
        usernameAlert.addAction(actionNext)
        usernameAlert.addAction(actionCancle)
        present(usernameAlert, animated: true, completion: nil)
    }
    
    func openPasswordAlert(){
        let passwordAlert = UIAlertController(title: "Enter password", message: "", preferredStyle: .alert)
        
        passwordAlert.addTextField { (textField:UITextField) in
            textField.placeholder = "password"
        }
        
        let actionNext = UIAlertAction(title: "connect", style: .default) { (action:UIAlertAction) in
            let textField = passwordAlert.textFields![0]
            if textField.text?.count == 0{
                self.openEmptyAlert(passwordAlert)
                return
            }
            self.password = textField.text
        }
        let actionCancle = UIAlertAction(title: "cancle", style: .cancel) { (action:UIAlertAction) in}
        
        passwordAlert.addAction(actionNext)
        passwordAlert.addAction(actionCancle)
        present(passwordAlert, animated: true, completion: nil)
    }
}

