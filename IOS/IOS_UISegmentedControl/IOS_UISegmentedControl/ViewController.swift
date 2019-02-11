//
//  ViewController.swift
//  IOS_UISegmentedControl
//
//  Created by hackeru on 11/02/2019.
//  Copyright © 2019 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var segmentedControl:UISegmentedControl!
    let items = ["windows", "mac os", "linux", "solaris"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        segmentedControl = UISegmentedControl(items: items)
        segmentedControl.frame.origin.y = 50
        segmentedControl.center.x = view.center.x
        segmentedControl.addTarget(self, action: #selector(segmantedChanged(sender:)), for: .valueChanged)
        view.addSubview(segmentedControl)
        
        let v = UIView(frame: CGRect(x: 30, y: 200, width: view.frame.width-40, height: 200))
        v.backgroundColor = UIColor.green
        view.addSubview(v)
    }

    @objc func segmantedChanged(sender: UISegmentedControl){
        print("select: \(items[sender.selectedSegmentIndex])")
    }
}

