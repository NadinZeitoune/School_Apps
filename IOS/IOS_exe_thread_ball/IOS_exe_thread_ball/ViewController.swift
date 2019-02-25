//
//  ViewController.swift
//  IOS_exe_thread_ball
//
//  Created by hackeru on 25/02/2019.
//  Copyright © 2019 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var ballImages: [UIImageView] = []
    var marginX: CGFloat! = 5
    var marginY: CGFloat! = 8
    var minY: CGFloat! = 80
    
    var btnAddBall: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnAddBall = UIButton(type: .system)
        btnAddBall.frame = CGRect(x: 0, y: 0, width: 100, height: minY)
        btnAddBall.setTitle("Add ball", for: .normal)
        btnAddBall.addTarget(self, action: #selector(btnAddBallClick(sender:)), for: .touchUpInside)
        view.addSubview(btnAddBall)
    }

    @objc func btnAddBallClick(sender: UIButton){
        addBall()
    }
    
    func addBall(){
        ballImages.append(UIImageView(image: UIImage(named: "ball")))
        ballImages[ballImages.count - 1].frame = CGRect(x: 0, y: minY, width: 90, height: 90)
        view.addSubview(ballImages[ballImages.count - 1])
        moveBall(marginX, marginY, ballImages[ballImages.count - 1])
    }

    func moveBall(_ marginX:CGFloat, _ marginY:CGFloat, _ ball:UIImageView) {
        let after = DispatchTime(uptimeNanoseconds: DispatchTime.now().uptimeNanoseconds + NSEC_PER_SEC / 25)
        DispatchQueue.main.asyncAfter(deadline: after) {
            self.checkBounds(marginX, marginY, ball)
        }
    }
    
    func checkBounds(_ marginX:CGFloat, _ marginY:CGFloat, _ ball:UIImageView){
        var marX = marginX
        var marY = marginY
        
        if ball.frame.maxX + marX > self.view.frame.maxX || ball.frame.minX + marX < self.view.frame.minX{
            marX = -1 * marX
        }
        if ball.frame.maxY + marY > self.view.frame.maxY || (ball.frame.minY - self.minY) + marY < self.view.frame.minY{
            marY = -1 * marY
        }
        
        ball.frame = CGRect(x: ball.frame.origin.x + marX, y: ball.frame.origin.y + marY, width: ball.frame.width, height: ball.frame.height)
        self.moveBall(marX, marY, ball)
    }
}

