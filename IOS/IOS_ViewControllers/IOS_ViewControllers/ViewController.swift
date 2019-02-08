//
//  ViewController.swift
//  IOS_ViewControllers
//
//  Created by hackeru on 07/02/2019.
//  Copyright © 2019 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var lableTitle: UILabel!
    var btnShowSecond:UIButton!
    var btnShowThird:UIButton!
    
    var secondView:SecondViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        lableTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        lableTitle.center = view.center
        lableTitle.text = "First view"
        view.addSubview(lableTitle)
        
        btnShowSecond = UIButton(type: .system)
        btnShowSecond.frame = CGRect(x: 20, y: lableTitle.frame.maxY, width: 200, height: 30)
        btnShowSecond.setTitle("show second", for: .normal)
        btnShowSecond.addTarget(self, action: #selector(btnShowSecondClicked(sender:)), for: .touchUpInside)
        view.addSubview(btnShowSecond)
        
        btnShowThird = UIButton(type: .system)
        btnShowThird.frame = CGRect(x: 180, y: lableTitle.frame.maxY, width: 200, height: 30)
        btnShowThird.setTitle("show Third", for: .normal)
        btnShowThird.addTarget(self, action: #selector(btnShowThirdClicked(sender:)), for: .touchUpInside)
        view.addSubview(btnShowThird)
    }
    
    @objc func btnShowSecondClicked(sender: UIButton){
        let secondViewController = SecondViewController()
        
        self.present(secondViewController, animated: true, completion: nil)
    }
    
    @objc func btnShowThirdClicked(sender: UIButton){
        let secondViewController = SecondViewController()
        self.secondView!.firstView = self
        self.present(secondViewController, animated: true, completion: nil)
    }
}

