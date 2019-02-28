//
//  AppDelegate.swift
//  IOS_Completing_Long_Tasks_InBackground
//
//  Created by hackeru on 28/02/2019.
//  Copyright © 2019 hackeru. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var timer: Timer!
    var counter = 0
    var backgroundTaskIdentifier: UIBackgroundTaskIdentifier = .invalid

    var appStateDelagate: AppStateDelagate?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    fileprivate func endBackgroundTask() {
        self.timer.invalidate()
        UIApplication.shared.endBackgroundTask(self.backgroundTaskIdentifier)
        self.backgroundTaskIdentifier = .invalid
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        
        NotificationCenter.default.post(name: Notification.Name(rawValue: "didenterbackground"), object: nil)
        
        timer = Timer.scheduledTimer(withTimeInterval: TimeInterval(exactly: 1)!, repeats: true, block: { [weak self] (timer: Timer) in
            print("tick \(self!.counter)  \(UIApplication.shared.backgroundTimeRemaining)")
            self!.counter += 1
            
            
        })
        
        backgroundTaskIdentifier = application.beginBackgroundTask(withName: "task1", expirationHandler: { [weak self] in
            self!.endBackgroundTask()
        })
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
        NotificationCenter.default.post(name: Notification.Name(rawValue: "willenterforeground"), object: nil)
        
        if backgroundTaskIdentifier != .invalid {
            endBackgroundTask()
        }
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}


protocol AppStateDelagate {
    func didEnterBackground()
    func willEnterForeground()
}
