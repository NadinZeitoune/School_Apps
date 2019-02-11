//
//  ViewController.swift
//  IOS_UIDatePicker
//
//  Created by hackeru on 11/02/2019.
//  Copyright © 2019 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var datePicker : UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker = UIDatePicker(frame: CGRect(x: 5, y: 80, width: view.frame.width-5-5, height: 300))
        view.addSubview(datePicker)
        datePicker.addTarget(self, action: #selector(dateChanged(sender:)), for: .valueChanged)
        let oneYearTime:TimeInterval = 365 * 24 * 60 * 60
        let today = Date()
        let oneYearFromToday = today.addingTimeInterval(oneYearTime)
        datePicker.minimumDate = today
        datePicker.maximumDate = oneYearFromToday
        datePicker.datePickerMode = .date
    }
    
    @objc func dateChanged(sender: UIDatePicker){
        print(sender.date)
    }
}

