//
//  ViewController.swift
//  IOS_exe_finalExe
//
//  Created by hackeru on 25/03/2019.
//  Copyright © 2019 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    var listSwitch: UISegmentedControl!
    var firstListView: UITableView!
    var secondListView: UITableView!
    
    let listNames = ["First list", "Second list"]
    
    var userPositionK: UInt!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create both lists with: ishidden = true
    }

    @objc func listSwitchChanged(sender: UISegmentedControl){
        // chosen list.ishidden = false
        // dichosen list.ishidden = true
    }
}

