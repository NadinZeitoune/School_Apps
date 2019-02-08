//
//  ViewController.swift
//  IOS_UIButton
//
//  Created by hackeru on 04/02/2019.
//  Copyright © 2019 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var buttonPlus: UIButton!
    var buttonMinus: UIButton!
    var lable: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        buttonPlus = UIButton(type: .system)
        buttonPlus.frame = CGRect(x: 0, y: 0, width: 20, height: 30)
        buttonPlus.center = view.center
        buttonPlus.setTitle("+", for: .normal)
        buttonPlus.backgroundColor = UIColor.lightGray
        buttonPlus.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        buttonPlus.tag = 1
        view.addSubview(buttonPlus)
        buttonPlus.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
        
        
        var newX = buttonPlus.frame.origin.x + (buttonPlus.frame.width * 2)
        let newY = buttonPlus.frame.origin.y
        buttonMinus = UIButton(type: .system)
        buttonMinus.frame = CGRect(x: newX, y: newY, width: 20, height: 30)
        buttonMinus.setTitle("-", for: .normal)
        buttonMinus.backgroundColor = UIColor.lightGray
        buttonMinus.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        buttonMinus.tag = -1
        view.addSubview(buttonMinus)
        buttonMinus.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
        
        newX = buttonPlus.frame.origin.x + buttonPlus.frame.width
        lable = UILabel(frame: CGRect(x: newX, y: newY, width: 20, height: 30))
        lable.textAlignment = NSTextAlignment.center
        lable.text = "0"
        view.addSubview(lable)
    }
    
    @objc func buttonTapped(sender:UIButton){
        var num = Int(lable.text!)!
        let max = 5
        let min = 0
        
        
        switch sender.tag {
        case 1:
            // plus
            if num == max{
                // show max alert
                return
            }
            num += 1
        case -1:
            // minus
            if num == min{
                // show min alert
                return
            }
            num -= 1
        default:
            num = num * 1
        }
        
        lable.text = String(num)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

