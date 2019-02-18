//
//  ViewController.swift
//  IOS_exe_progress_btn
//
//  Created by hackeru on 18/02/2019.
//  Copyright © 2019 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var progressView : ProgressView!
    var btnPlus : UIButton!
    var btnMinos : UIButton!
    let newValue : CGFloat = 0.1

    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressView = ProgressView(frame: CGRect(x: 60, y: 200, width: 200, height: 40))
        view.addSubview(progressView)
        
        btnMinos = UIButton(type: .system)
        btnMinos.frame = CGRect(x: 0, y: 200, width: 80, height: 40)
        btnMinos.setTitle("-", for: .normal)
        btnMinos.addTarget(self, action: #selector(btnMinosClicked(sender:)), for: .touchUpInside)
        view.addSubview(btnMinos)
        
        btnPlus = UIButton(type: .system)
        btnPlus.frame = CGRect(x: progressView.frame.maxX, y: 200, width: 80, height: 40)
        btnPlus.setTitle("+", for: .normal)
        btnPlus.addTarget(self, action: #selector(btnPlusClicked(sender:)), for: .touchUpInside)
        view.addSubview(btnPlus)
    }
    
    @objc func btnPlusClicked(sender: UIButton){
        let addValue = newValue + progressView.progress
        if  addValue <= 1 {
            progressView.progress = addValue
        }
    }
    
    @objc func btnMinosClicked(sender: UIButton){
        let subValue = progressView.progress - newValue
        if  subValue >= 0 {
            progressView.progress = subValue
        }
    }
}

