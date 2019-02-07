//
//  ThirdViewController.swift
//  IOS_ViewControllers
//
//  Created by hackeru on 07/02/2019.
//  Copyright © 2019 hackeru. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    var lableTitle:UILabel!
    var btnShowFirst : UIButton!
    var btnShowSecond : UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        lableTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        lableTitle.center = view.center
        lableTitle.text = "Third view"
        view.addSubview(lableTitle)
        
        
        btnShowFirst = UIButton(type: .system)
        btnShowFirst.frame = CGRect(x: 20, y: lableTitle.frame.maxY, width: 200, height: 30)
        btnShowFirst.setTitle("show First", for: .normal)
        btnShowFirst.addTarget(self, action: #selector(btnShowFirstClicked(sender:)), for: .touchUpInside)
        view.addSubview(btnShowFirst)
        
        btnShowSecond = UIButton(type: .system)
        btnShowSecond.frame = CGRect(x: 180, y: lableTitle.frame.maxY, width: 200, height: 30)
        btnShowSecond.setTitle("show second", for: .normal)
        btnShowSecond.addTarget(self, action: #selector(btnShowSecondClicked(sender:)), for: .touchUpInside)
        view.addSubview(btnShowSecond)
        
    }
    
    @objc func btnShowFirstClicked(sender: UIButton) {
        //self.dismiss(animated: true, completion: nil)
    }
    
    @objc func btnShowSecondClicked(sender: UIButton){
        self.dismiss(animated: true, completion: nil)
    }
}

