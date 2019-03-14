//
//  ViewController.swift
//  IOS_CoreMotion
//
//  Created by hackeru on 14/03/2019.
//  Copyright © 2019 hackeru. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController{

    var motionManager: CMMotionManager!
    var totalRotation: Double = 0
    var isCalibrated = 0
    var calibration: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        motionManager = CMMotionManager()
        
        /*motionManager.accelerometerUpdateInterval = 1.0 / 30.0
        motionManager.startAccelerometerUpdates(to: OperationQueue.main) { (data: CMAccelerometerData?, error: Error?) in
            if error == nil{
                if let theData = data{
                    let acc = theData.acceleration
                    print("x: \(acc.x), y: \(acc.y), z: \(acc.z)")
                }
            }
        }*/
        
        motionManager.gyroUpdateInterval = 1.0 / 30.0
        motionManager.startGyroUpdates(to: OperationQueue.main) { (data: CMGyroData?, error: Error?) in
            if error == nil{
                if let theData = data{
                    if self.isCalibrated >= 10{
                        self.totalRotation += theData.rotationRate.x + self.calibration
                        print("\(self.totalRotation)")
                    }else{
                        self.calibration += theData.rotationRate.x
                        self.isCalibrated += 1
                        
                        if self.isCalibrated == 10 {
                            self.calibration /= -10
                        }
                    }
                }
            }
        }
    }


}

