//
//  ViewController.swift
//  IOS_exe_segmentedControl
//
//  Created by hackeru on 11/02/2019.
//  Copyright © 2019 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var segControl : UISegmentedControl!
    var v1 : UIView!
    var v2 : UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createSegControl()
    }
    
    func createSegControl() {
        segControl = UISegmentedControl(items: ["first", "second"])
        segControl.frame.origin.y = 50
        segControl.center.x = view.center.x
        segControl.addTarget(self, action: #selector(segChanged(sender:)), for: .valueChanged)
        view.addSubview(segControl)
    }
    
    func createView(_ lable:String, _ viewP: UIView){
        //viewP = 
    }
    
    @objc func segChanged(sender: UISegmentedControl){
        
    }
}

