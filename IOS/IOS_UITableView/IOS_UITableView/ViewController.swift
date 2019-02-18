//
//  ViewController.swift
//  IOS_UITableView
//
//  Created by hackeru on 18/02/2019.
//  Copyright © 2019 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    var tableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView(frame: view.frame, style: .plain)
        
        // this line helps with recycling views
        //tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "identifier")
        
        tableView.dataSource = self
        view.addSubview(tableView)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "identifier", for: indexPath)
        var cell = tableView.dequeueReusableCell(withIdentifier: "identifier")
        if cell == nil{
            cell = UITableViewCell(style: .default, reuseIdentifier: "identifier")
        }
        
        cell!.textLabel!.text = "row \(indexPath.row + 1)"
        
        return cell!
    }
    
    /*// vanishing the status bar in this viewController
    override var prefersStatusBarHidden: Bool{
        get{
            return true
        }
    }*/
}







