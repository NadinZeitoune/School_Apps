//
//  ViewController.swift
//  IOS_exe_PickerView
//
//  Created by hackeru on 11/02/2019.
//  Copyright © 2019 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    
    var datePickerView : UIPickerView!
    var dateAlertController : UIAlertController!
    var daysInMonth : Int = 31
    let daysInEachMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    let firstDayOfYear = 3

    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePickerView = UIPickerView()
        datePickerView.center = view.center
        datePickerView.dataSource = self
        datePickerView.delegate = self
        view.addSubview(datePickerView)
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return 12
        }
        else{
            return daysInMonth
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            let month = ["January","Febuary","March","April","May","June","July","August","September","October","November","December"]
            return month[row]
        }
        else{
            return "\(row+1)"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            daysInMonth = daysInEachMonth[row]
            pickerView.reloadComponent(1)
        }
        
        let day = pickerView.selectedRow(inComponent: 1)
        let month = pickerView.selectedRow(inComponent: 0)
        let days = ["Sunday", "Monday", "Tuesday", "Wendsday", "Thursday", "Friday", "Suterday"]
        dateAlertController = UIAlertController(title: "Date", message: "\(days[calcDay(day, month)])", preferredStyle: .alert)
        let actionOK = UIAlertAction(title: "OK", style: .default, handler: nil)
        dateAlertController.addAction(actionOK)
        present(dateAlertController, animated: true, completion: nil)
    }
    
    func calcDay(_ day:Int, _ month: Int) -> Int {
        var sum = day + (firstDayOfYear - 1)
        
        for i in 0..<month {
            sum += daysInEachMonth[i]
        }
        sum %= 7
        return sum
    }
}



