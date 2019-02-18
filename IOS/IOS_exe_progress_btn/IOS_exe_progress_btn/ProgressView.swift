//
//  ProgressView.swift
//  IOS_exe_progress_btn
//
//  Created by hackeru on 18/02/2019.
//  Copyright © 2019 hackeru. All rights reserved.
//

import UIKit

class ProgressView : UIView{
    
    private var _progress:CGFloat = 0
    private var _progressView: UIView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        _progressView = UIView(frame: internalViewRect())
        backgroundColor = UIColor.gray
        _progressView.backgroundColor = UIColor.blue
        self.addSubview(_progressView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func internalViewRect()->CGRect{
        return CGRect(x: 0, y: 0, width: _progress * self.frame.width, height: frame.height)
    }
    
    public var progress:CGFloat{
        get{
            return _progress
        }
        set{
            if newValue >= 0.0 && newValue <= 1.0{
                _progress = newValue
                _progressView.frame = internalViewRect()
            }
        }
    }
    
    public var completedColor:UIColor{
        get{
            return _progressView.backgroundColor!
        }
        set{
            if newValue != self.backgroundColor!{
                _progressView.backgroundColor = newValue
            }
        }
    }
    
    override var backgroundColor: UIColor?{
        get{
            return super.backgroundColor
        }
        set{
            if let theBackgroundColor = _progressView.backgroundColor{
                if newValue != theBackgroundColor{
                    super.backgroundColor = newValue
                }
            }else{
                super.backgroundColor = newValue
            }
            
        }
    }
}
