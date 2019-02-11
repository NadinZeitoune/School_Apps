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
    var action : String!

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
        action = "login"
        openUsernameAlert()
    }
    
    @objc func btnSignUpClicked(sender: UIButton){
        action = "signUp"
        openUsernameAlert()
    }
    
    func getUrlConnection(action:String) /*-> String*/{
        let url = URL(string: "http://localhost:8080/IOS_exe_alert_server_war_exploded/server?action=\(action)&username=\(userName!)&password=\(password!)")
        let urlRequest = URLRequest(url:url!)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: urlRequest){(data:Data?, urlResponse:URLResponse?, error:Error?) in
            if error == nil {
                if let theData = data{
                    if theData.count > 0{
                        let responseFromServer = String(data: theData, encoding: String.Encoding.utf8)!
                        
                        if responseFromServer == "100"{
                            // Show success message
                            self.openMessageAlert("YOU'R IN!")
                        }else{
                            // Show message with the response from the server.
                            self.openMessageAlert(responseFromServer)
                        }
                        
                        // OR return
                    }
                }
            }else{
                print("error: \(error!)")}
        }
        task.resume()
        sleep(5)
    }
    
    func openMessageAlert(_ message:String){
        let messageAlert = UIAlertController(title: "Message", message : message, preferredStyle: .alert)
        let actionOK = UIAlertAction(title: "OK", style: .default){(action:UIAlertAction) in}
        messageAlert.addAction(actionOK)
        present(messageAlert, animated: true, completion: nil)
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
        let actionCancel = UIAlertAction(title: "cancel", style: .cancel) { (action:UIAlertAction) in}// OR handler: nil
        
        usernameAlert.addAction(actionNext)
        usernameAlert.addAction(actionCancel)
        present(usernameAlert, animated: true, completion: nil)
    }
    
    func openPasswordAlert(){
        let passwordAlert = UIAlertController(title: "Enter password", message: "", preferredStyle: .alert)
        
        passwordAlert.addTextField { (textField:UITextField) in
            textField.placeholder = "password"
            textField.isSecureTextEntry = true
        }
        
        let actionNext = UIAlertAction(title: "connect", style: .default) { (action:UIAlertAction) in
            let textField = passwordAlert.textFields![0]
            if textField.text?.count == 0{
                self.openEmptyAlert(passwordAlert)
                return
            }
            self.password = textField.text
            
            self.getUrlConnection(action: self.action!)
        }
        let actionCancel = UIAlertAction(title: "cancel", style: .cancel) { (action:UIAlertAction) in}
        
        passwordAlert.addAction(actionNext)
        passwordAlert.addAction(actionCancel)
        present(passwordAlert, animated: true, completion: nil)
    }
}

