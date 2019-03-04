//
//  ViewController.swift
//  IOS_Gesture_Recognizer
//
//  Created by hackeru on 04/03/2019.
//  Copyright © 2019 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initTap()
    }
    
    // Tap
    var tapGestureRecognizer: UITapGestureRecognizer!
    
    func initTap(){
        tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func handleTap(sender: UITapGestureRecognizer){
        let location = sender.location(in: view)
        print(location)
    }
    
    // Long press
    var longPressGestureRecognizer: UILongPressGestureRecognizer!
    
    func initLongPress(){
        longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(sender:)))
        
        label = UILabel(frame: CGRect(x: 0, y: 0, width: 120, height: 40))
        label.center = view.center
        label.text = "Hey Gitit"
        label.backgroundColor = UIColor.lightGray
        label.isUserInteractionEnabled = true
        
        longPressGestureRecognizer.numberOfTouchesRequired = 2
        longPressGestureRecognizer.allowableMovement = 100
        longPressGestureRecognizer.minimumPressDuration = 1
        
        view.addGestureRecognizer(longPressGestureRecognizer)
    }
    
    @objc func handleLongPress(sender: UILongPressGestureRecognizer){
        let location1 = sender.location(ofTouch: 0, in: sender.view)
        let location2 = sender.location(ofTouch: 1, in: sender.view)
        let newX = (location2.x + location1.x) / 2
        let newY = (location2.y + location1.y) / 2
        label.center = CGPoint(x: newX, y: newY)
    }
    
    // Pan == Drag
    var panRecognizer: UIPanGestureRecognizer!
    
    func initPanGestureRecognizer(){
        panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(hanlePan(sender:)))
        panRecognizer.minimumNumberOfTouches = 1
        panRecognizer.maximumNumberOfTouches = 1
        
        label = UILabel(frame: CGRect(x: 0, y: 0, width: 120, height: 40))
        label.center = view.center
        label.text = "good morning"
        label.backgroundColor = UIColor.lightGray
        label.isUserInteractionEnabled = true
        view.addSubview(label)
        
        label.addGestureRecognizer(panRecognizer)
    }
    
    @objc func hanlePan(sender: UIPanGestureRecognizer){
        if sender.state != .ended && sender.state != .failed{
            let location = sender.location(in: sender.view!.superview)
            sender.view!.center = location
        }
    }
    
    // Rotation:
    var rotationRecognizer: UIRotationGestureRecognizer!
    var label: UILabel!
    var angle: CGFloat = 0
    
    func initRotationRecognizer(){
        rotationRecognizer = UIRotationGestureRecognizer(target: self, action: #selector(handleRotation(sender:)))
        view.addGestureRecognizer(rotationRecognizer)
        
        label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        label.center = view.center
        label.text = "good morning"
        label.sizeToFit()
        view.addSubview(label)
    }
    
    @objc func handleRotation(sender: UIRotationGestureRecognizer){
        label.transform = CGAffineTransform(rotationAngle: sender.rotation + angle)
        if sender.state == .ended {
            angle += sender.rotation
        }
    }
    
    // Swipe:
    var swipeRecognizer: UISwipeGestureRecognizer!
    
    func initSwipeGestureReconizer(){
        swipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        swipeRecognizer.direction = .left
        swipeRecognizer.numberOfTouchesRequired = 1
        view.addGestureRecognizer(swipeRecognizer)
    }

    @objc func handleSwipe(sender: UISwipeGestureRecognizer){
        print("swipe left with 1 finger detected")
    }
}

