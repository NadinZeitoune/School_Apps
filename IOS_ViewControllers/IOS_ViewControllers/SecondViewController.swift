//
//  SecondViewController.swift
//  IOS_ViewControllers
//
//  Created by hackeru on 07/02/2019.
//  Copyright © 2019 hackeru. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    var lableTitle:UILabel!
    var btnShowFirst : UIButton!
    var btnShowThird : UIButton!
    
    var firstView : ViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        lableTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        lableTitle.center = view.center
        lableTitle.text = "Second view"
        view.addSubview(lableTitle)
        
        
        btnShowFirst = UIButton(type: .system)
        btnShowFirst.frame = CGRect(x: 20, y: lableTitle.frame.maxY, width: 200, height: 30)
        btnShowFirst.setTitle("show First", for: .normal)
        btnShowFirst.addTarget(self, action: #selector(btnShowFirstClicked(sender:)), for: .touchUpInside)
        view.addSubview(btnShowFirst)
        
        btnShowThird = UIButton(type: .system)
        btnShowThird.frame = CGRect(x: 180, y: lableTitle.frame.maxY, width: 200, height: 30)
        btnShowThird.setTitle("show Third", for: .normal)
        btnShowThird.addTarget(self, action: #selector(btnShowThirdClicked(sender:)), for: .touchUpInside)
        view.addSubview(btnShowThird)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let third = firstView {
            btnShowThirdClicked(sender: UIButton())
        }
    }
    
    @objc func btnShowFirstClicked(sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func btnShowThirdClicked(sender: UIButton){
        let thirdViewController = ThirdViewController()
        self.present(thirdViewController, animated: true, completion: nil)
    }
}
