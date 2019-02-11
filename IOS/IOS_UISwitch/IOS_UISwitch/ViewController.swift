//
//  ViewController.swift
//  IOS_UISwitch
//
//  Created by hackeru on 11/02/2019.
//  Copyright © 2019 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var mainSwitch: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainSwitch = UISwitch(frame: CGRect(x: 100, y: 100, width: 0, height: 0))
        view.addSubview(mainSwitch)
        mainSwitch.addTarget(self, action: #selector(mainSwithChanged(sender:)), for: .valueChanged)
        mainSwitch.tintColor = UIColor.green
        
    }
    
    @objc func mainSwithChanged(sender: UISwitch){
        print("value changed \(sender.isOn)")
    }
}

