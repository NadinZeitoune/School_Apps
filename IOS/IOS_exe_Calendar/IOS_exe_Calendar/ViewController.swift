//
//  ViewController.swift
//  IOS_exe_Calendar
//
//  Created by hackeru on 14/03/2019.
//  Copyright © 2019 hackeru. All rights reserved.
//

import UIKit
import EventKit

class ViewController: UIViewController {
    
    var eventStore: EKEventStore!
    var eventTitle: UITextField!
    var notes: UITextField!
    var startBtn: UIButton!
    var startDate: Date!
    var endBtn: UIButton!
    var endDate: Date!
    
    var alertController: UIAlertController!
    
    var datePicker: UIDatePicker!
    var datePickerBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initScreen()
        initDatePicker()

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        requestPermissionForCalendar()

    }
    
    func initDatePicker() {
        datePicker = UIDatePicker(frame: CGRect(x: 5, y: 80, width: view.frame.width-5-5, height: 300))
        datePicker.datePickerMode = .dateAndTime
        datePicker.backgroundColor = UIColor.lightGray
        datePicker.timeZone = TimeZone.current
        
        datePickerBtn = UIButton(type: .system)
        datePickerBtn.frame = CGRect(x: 0, y: datePicker.frame.maxY + 10, width: 50, height: 30)
        datePickerBtn.center.x = datePicker.center.x
        datePickerBtn.setTitle("Select", for: .normal)
        datePickerBtn.addTarget(self, action: #selector(handleDatePickerBtnClick(sender:)), for: .touchUpInside)
    }
    
    func timeZone(date: Date) -> String{
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium

        return formatter.string(from: date)
    }
    
    @objc func handleDatePickerBtnClick(sender: UIButton){
        // start date
        if datePicker.tag == 1{
            startDate = datePicker.date
            startBtn.setTitle(timeZone(date: startDate), for: .normal)
        }
        // end date
        else{
            endDate = datePicker.date
            endBtn.setTitle(timeZone(date: endDate), for: .normal)
        }
        
        sender.removeFromSuperview()
        datePicker.removeFromSuperview()
    }
    
    func requestPermissionForCalendar() {
        eventStore = EKEventStore()
        eventStore.requestAccess(to: .event) { (permitted: Bool, error: Error?) in
            if error == nil{
                if !permitted{
                    self.popAlert(title: "STOP!", message: "please allow caleder")
                }
            }
        }
    }

    func initScreen() {
        startBtn = UIButton(type: .system)
        startBtn.frame = CGRect(x: 0, y: 200, width: 200, height: 30)
        startBtn.center.x = view.center.x
        startBtn.tag = 1
        startBtn.setTitle("Click to add start time", for: .normal)
        startBtn.addTarget(self, action: #selector(handleDateBtnClick(sender:)), for: .touchUpInside)
        view.addSubview(startBtn)
        
        endBtn = UIButton(type: .system)
        endBtn.frame = CGRect(x: 0, y: startBtn.frame.origin.y + 30, width: 200, height: 30)
        endBtn.center.x = view.center.x
        endBtn.tag = 2
        endBtn.setTitle("Click to add end time", for: .normal)
        endBtn.addTarget(self, action: #selector(handleDateBtnClick(sender:)), for: .touchUpInside)
        view.addSubview(endBtn)
        
        eventTitle = UITextField(frame: CGRect(x: 0, y: endBtn.frame.origin.y + 30, width: 200, height: 30))
        eventTitle.center.x = view.center.x
        eventTitle.placeholder = "Add title to the event..."
        view.addSubview(eventTitle)
        
        notes = UITextField(frame: CGRect(x: 0, y: eventTitle.frame.origin.y + 30, width: 200, height: 30))
        notes.center.x = view.center.x
        notes.placeholder = "Add notes to the event..."
        view.addSubview(notes)
        
        let submitBtn = UIButton(type: .system)
        submitBtn.frame = CGRect(x: 0, y: notes.frame.origin.y + 50, width: 100, height: 30)
        submitBtn.center.x = view.center.x
        submitBtn.setTitle("Submit", for: .normal)
        submitBtn.addTarget(self, action: #selector(handleSubmitBtnClick(sender:)), for: .touchUpInside)
        view.addSubview(submitBtn)
    }
    
    @objc func handleDateBtnClick(sender: UIButton){
        datePicker.tag = sender.tag
        
        view.addSubview(datePicker)
        view.addSubview(datePickerBtn)
    }
    
    @objc func handleSubmitBtnClick(sender: UIButton){
        if makeSureAllDataWritten(){
            if let cal = getCalendar(byName: "Calendar"){
                let event = EKEvent(eventStore: eventStore)
                event.title = eventTitle.text!
                event.notes = notes.text!
                event.calendar = cal
                (event.startDate, event.endDate) = (self.startDate, self.endDate)
                do{
                    try eventStore.save(event, span: .thisEvent)
                    
                    popAlert(title: "Well Done!", message: "Your event was saved succesfully!")
                    
                    startBtn.setTitle("Click to add start time", for: .normal)
                    endBtn.setTitle("Click to add end time", for: .normal)
                    eventTitle.text = ""
                    notes.text = ""
                    
                }catch{
                    popAlert(title: "Somthing Wrong!", message: "Make sure all your details are logical")
                }
            }
        }else{
            popAlert(title: "Hold On!", message: "All the field are requierd!!")
        }
    }
    
    func popAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    func makeSureAllDataWritten() -> Bool{
        
        if startDate == nil || endDate == nil || eventTitle.text == nil || eventTitle.text?.count == 0 || notes.text == nil || notes.text?.count == 0{
            return false
        }
        
        return true
    }
    
    func getCalendar(byName name: String) -> EKCalendar?{
        let calendars: [EKCalendar] = eventStore.calendars(for: .event)
        var calendar: EKCalendar?
        
        for cal in calendars{
            if cal.title == name{
                calendar = cal
                break
            }
        }
        
        return calendar
    }
}

