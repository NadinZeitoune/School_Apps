//
//  ViewController.swift
//  IOS_exe_tableView
//
//  Created by hackeru on 18/02/2019.
//  Copyright © 2019 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{
    var dataSource : [String] = ["hello","world"]
    var table : UITableView!
    var tableDataSource : TableViewDataSource!
    var textField : UITextField!
    var submitBtn : UIButton!
    var howMuchToLiftUp: CGFloat = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableDataSource = TableViewDataSource(dataSource)
        table = UITableView(frame: CGRect(x: 5, y: 40, width: view.frame.width, height: view.frame.height - 30), style: .plain)
        table.dataSource = tableDataSource
        view.addSubview(table)
        
        textField = UITextField(frame: CGRect(x: view.frame.origin.x, y: view.frame.maxY - 30, width: view.frame.width - 80, height: 30))
        textField.borderStyle = .roundedRect
        textField.backgroundColor = UIColor.lightGray
        textField.delegate = self
        view.addSubview(textField)
        
        submitBtn = UIButton(type: .system)
        submitBtn.frame = CGRect(x: textField.frame.maxX, y: view.frame.maxY - 30, width: 80, height: 30)
        submitBtn.setTitle("Submit", for: .normal)
        submitBtn.addTarget(self, action: #selector(submitBtnClicked(sender:)), for: .touchUpInside)
        view.addSubview(submitBtn)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func submitBtnClicked(sender: UIButton){
        if let theText = textField.text {
            if !theText.isEmpty{
                dataSource.append(theText)
                tableDataSource.dataArr = dataSource
                table.reloadData()
                textField.text = ""
            }
        }
    }
    
    @objc func handleTap(sender: UITapGestureRecognizer){
        textField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc func handleKeyboardWillShow(notification: NSNotification){
        let frame = notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! CGRect
        howMuchToLiftUp = textField.frame.maxY - frame.minY + 5
        view.frame.origin.y -= howMuchToLiftUp
    }
    @objc func handleKeyboardWillHide(notification: NSNotification){
        view.frame.origin.y += howMuchToLiftUp
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

