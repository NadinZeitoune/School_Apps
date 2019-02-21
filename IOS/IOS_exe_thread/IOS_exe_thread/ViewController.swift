//
//  ViewController.swift
//  IOS_exe_thread
//
//  Created by hackeru on 21/02/2019.
//  Copyright © 2019 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var generator: UIGenerator!
    var label:UILabel!
    var buttonStart:UIButton!
    var buttonStop:UIButton!
    var counter: Int = 0
    var continueCounting = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        generator = UIGenerator(view: view)
        generator.addMargin(margin: 40)
        
        label = generator.addLabel(text: "\(counter)")
        buttonStop = generator.addButton(title: "Start", buttonDelegate: { (sender: UIButton) in
            self.continueCounting = true
            self.startCounting(proceed: self.continueCounting)
        })
        buttonStart = generator.addButton(title: "Stop", buttonDelegate: { (sender:UIButton) in
            self.continueCounting = false
        })
    }

    func startCounting(proceed:Bool) {
        if proceed {
            self.counter += 1
            
            let after = DispatchTime(uptimeNanoseconds: DispatchTime.now().uptimeNanoseconds + 1 * NSEC_PER_SEC)
            
            DispatchQueue.main.asyncAfter(deadline: after, execute: {
                self.label.text = String(self.counter)
                self.startCounting(proceed: self.continueCounting)
            })
        }
    }
}

