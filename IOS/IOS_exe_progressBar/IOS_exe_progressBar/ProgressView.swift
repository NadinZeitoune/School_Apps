//
//  ProgressView.swift
//  IOS_exe_progressBar
//
//  Created by hackeru on 14/02/2019.
//  Copyright © 2019 hackeru. All rights reserved.
//

import UIKit

class ProgressView: UIView {
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
    
    init(barSize : CGRect) {
        // Init the progress rectangels
        super.init(frame: barSize)
        self.tintColor = progressBackgroundColor
        
        var progressWidth = barSize.width - 10
        progressWidth *= CGFloat(self.progress)
        progressBar = UIView(frame: CGRect(x: barSize.minX + 5, y: barSize.minY + 5, width: progressWidth, height: barSize.height - 10))
        progressBar.tintColor = progressBarColor
        self.addSubview(progressBar)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setBackGroundColorTo(_ color : UIColor){
        if color != progressBarColor {
            progressBackgroundColor = color
            self.tintColor = progressBackgroundColor
        }
    }
    
    func setProgressBarColorTo(_ color : UIColor){
        if color != progressBackgroundColor {
            progressBarColor = color
            progressBar.tintColor = progressBarColor
        }
    }
}
