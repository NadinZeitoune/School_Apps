//
//  ViewController.swift
//  IOS_UIScrollView
//
//  Created by hackeru on 14/02/2019.
//  Copyright © 2019 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIScrollViewDelegate{

    var scrollView : UIScrollView!
    var imageView : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(named: "lion")
        imageView = UIImageView(image: image)
        scrollView = UIScrollView(frame: view.frame)
        scrollView.contentSize = imageView.frame.size
        scrollView.delegate = self
        scrollView.addSubview(imageView)
        view.addSubview(scrollView)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        imageView.alpha = 0.5
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        imageView.alpha = 1.0
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            imageView.alpha = 1.0
        }
    }
}

