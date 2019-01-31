//
//  ViewController.swift
//  IOS_UILable
//
//  Created by hackeru on 31/01/2019.
//  Copyright © 2019 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var lable:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lable = UILabel(frame: CGRect(x: 20, y: 180, width: 130, height: 30))
        lable.text = "hello world!"
        lable.backgroundColor = UIColor.lightGray
        lable.font = UIFont.boldSystemFont(ofSize: 24)
        
    
        
        lable.frame.origin.x = (view.frame.width / 2) - (lable.frame.width / 2)
        lable.frame.origin.y = view.frame.height / 2 - (lable.frame.height / 2)
        
        view.addSubview(lable)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}



