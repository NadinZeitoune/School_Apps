//
//  ViewController.swift
//  IOS_exe_files
//
//  Created by hackeru on 07/03/2019.
//  Copyright © 2019 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var cachesDirectory = FileManager().urls(for: .cachesDirectory, in: .userDomainMask)[0]
    let fileManager = FileManager()
    var image: UIImageView!
    var data: NSData!
    

    var userNameInput: UITextField!
    var passwordInput: UITextField!
    var loginBtn: UIButton!
    var rememberMe: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Check if file exist- if does show pic // -> move to second with (remembered: true)
        cachesDirectory.appendPathComponent("myPic.bin")
        
        if fileManager.fileExists(atPath: cachesDirectory.absoluteString){
            do{
                data = try NSData(contentsOfFile: cachesDirectory.absoluteString, options: NSData.ReadingOptions.mappedIfSafe)
            }catch{
                
            }
        }else{
            // get image from server + save to file
            
        }
        
        image = UIImageView(frame: view.frame)
        //image.image = UIImage(data: data as Data)
    }
    
    @objc func handleLoginBtnClicked(sender: UIButton){
        moveToNext(remembered: rememberMe.isOn)
    }
    func moveToNext(remembered: Bool){
        let secondController = SecondViewController()
        secondController.isRemembered = remembered
        present(secondController, animated: true, completion: nil)
    }
    func anotherExe() {
        passwordInput = UITextField(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        passwordInput.center = view.center
        passwordInput.borderStyle = .roundedRect
        passwordInput.placeholder = "password"
        view.addSubview(passwordInput)
        
        userNameInput = UITextField(frame: CGRect(x: passwordInput.frame.origin.x, y: passwordInput.frame.minY - 30 - 5, width: 100, height: 30))
        userNameInput.borderStyle = .roundedRect
        userNameInput.placeholder = "username"
        view.addSubview(userNameInput)
        
        loginBtn = UIButton(type: .system)
        loginBtn.frame = CGRect(x: passwordInput.frame.origin.x, y: passwordInput.frame.maxY + 5, width: 100, height: 30)
        loginBtn.setTitle("Login", for: .normal)
        loginBtn.addTarget(self, action: #selector(handleLoginBtnClicked(sender:)), for: .touchUpInside)
        view.addSubview(loginBtn)
        
        rememberMe = UISwitch(frame: CGRect(x: 0, y: loginBtn.frame.maxY + 10, width: 5, height: 5))
        rememberMe.center.x = view.center.x
        view.addSubview(rememberMe)
    }
}

