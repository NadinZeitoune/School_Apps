//
//  ViewController.swift
//  IOS_Calendar
//
//  Created by hackeru on 14/03/2019.
//  Copyright © 2019 hackeru. All rights reserved.
//

import UIKit
import EventKit

class ViewController: UIViewController {

    var eventStore: EKEventStore!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        eventStore = EKEventStore()
        eventStore.requestAccess(to: .event) { (permitted: Bool, error: Error?) in
            if error == nil{
                if permitted{
                    print("we have permission :)")
                    //self.addEventToCalnedar()
                    self.fetchEvents()
                }else{
                    print("we don't have permission")
                }
            }else{
                print("we have access error: \(error!)")
            }
        }
    }
    
    func addEventToCalnedar(){
        if let cal = getCalendar(byName: "Calendar"){
            let greg = Calendar.init(identifier: .gregorian)
            var dateComponents = DateComponents(year: 2019, month: 3, day: 14, hour: 9)
            let date1 = greg.date(from: dateComponents)
            dateComponents.hour = dateComponents.hour! + 1
            let date2 = greg.date(from: dateComponents)!
            let event = EKEvent(eventStore: self.eventStore)
            event.title = "Take a lunch break"
            event.notes = "not really"
            event.calendar = cal
            (event.startDate, event.endDate) = (date1, date2)
            let alarm = EKAlarm(relativeOffset: -3600) // in seconds = -3600 == 1 hour before
            event.addAlarm(alarm)
            
            do{
                try eventStore.save(event, span: .thisEvent)
            }catch{
                print("error")
            }
            
        }
    }
    
    func fetchEvents(){
        if let cal = getCalendar(byName: "Calendar"){
            let greg = Calendar(identifier: .gregorian)
            let today = Date()
            let date1 = greg.date(byAdding: DateComponents(month: -1), to: today)!
            let date2 = greg.date(byAdding: DateComponents(month: 1), to: today)!
            let predicate = eventStore.predicateForEvents(withStart: date1, end: date2, calendars: [cal])
            
            DispatchQueue.global().async {
                self.eventStore.enumerateEvents(matching: predicate, using: { (event: EKEvent, stop: UnsafeMutablePointer<ObjCBool>) in
                    if let theTitle = event.title{
                        print("title: \(theTitle)")
                        if theTitle == "Take a break"{
                            stop.pointee = true
                        }
                    }
                })
            }
        }
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

