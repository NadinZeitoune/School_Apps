//
//  ViewController.swift
//  IOS_UISlider
//
//  Created by hackeru on 11/02/2019.
//  Copyright © 2019 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var slider : UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        slider = UISlider(frame: CGRect(x: 5, y: 100, width: view.frame.width-10, height: 30))
        slider.minimumValue = 0
        slider.maximumValue = 10
        slider.value = 5
        slider.addTarget(self, action: #selector(sliderChanged(sender:)), for: .valueChanged)
        view.addSubview(slider)
    }
    
    @objc func sliderChanged(sender : UISlider){
        /*let x = sender.value.rounded()
        slider.value = x*/
        print("slider: \(sender.value)")
    }
}

