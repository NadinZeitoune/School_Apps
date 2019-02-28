//
//  ViewController.swift
//  IOS_Completing_Long_Tasks_InBackground
//
//  Created by hackeru on 28/02/2019.
//  Copyright © 2019 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController, AppStateDelagate {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let appDelagate = UIApplication.shared.delegate as! AppDelegate
        //appDelagate.appStateDelagate = self
        NotificationCenter.default.addObserver(self, selector: #selector(didEnterBackground), name: NSNotification.Name(rawValue: "didenterbackground"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(willEnterForeground), name: NSNotification.Name(rawValue: "willenterforeground"), object: nil)
        
        
    }

    @objc func didEnterBackground() {
        
    }
    
    @objc func willEnterForeground() {
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

