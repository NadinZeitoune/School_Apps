//
//  ProgressView.swift
//  IOS_exe_progressBar
//
//  Created by hackeru on 14/02/2019.
//  Copyright © 2019 hackeru. All rights reserved.
//

import UIKit

class ProgressView: UIView {
    var progressBackgroundColor: UIColor!
    var progressColor: UIColor!
    var progress : Float{
        get{
            return self.progress
        }
        set(newProgress){
            if newProgress < 1 && newProgress > 0 {
                self.progress = newProgress
            }
        }
    }
    
    
    
}
