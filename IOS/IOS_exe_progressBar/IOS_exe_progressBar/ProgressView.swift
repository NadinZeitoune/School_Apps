//
//  ProgressView.swift
//  IOS_exe_progressBar
//
//  Created by hackeru on 14/02/2019.
//  Copyright © 2019 hackeru. All rights reserved.
//

import UIKit 

class ProgressView: UIView {
    var progressBackground : UIView!
    var progressBackgroundColor: UIColor! = UIColor.white

    var progressBar : UIView!
    var progressBarColor: UIColor! = UIColor.black
    
    var progress : Float{
        get{
            return self.progress
        }
        set(newProgress){
            if newProgress <= 1 && newProgress >= 0 { // == 0...1 {
                self.progress = newProgress
            }
        }
    }

    init(_ barSize : CGRect) {
        // Init the progress rectangels
        progressBackground = UIView(frame: barSize)
        progressBackground.color = progressBackgroundColor
        self.addSubView(progressBackground)

        var progressWidth = barSize.width - 10
        progressWidth *= self.progress
        progressBar = UIView(frame: CGRect(x: barSize.x + 5, y: barSize.y + 5, width: progressWidth, height: barSize.height - 10))
        progressBar.color = progressBarColor
        self.addSubView(progressBar)
    }
    
    
    func setBackGroundColorTo(_ color : UIColor){
        if color != progressBarColor {
            progressBackgroundColor = color
        }
    }
    
    func setProgressBarColorTo(_ color : UIColor){
        if color != progressBackgroundColor {
            progressBarColor = color
        }
    }
}
