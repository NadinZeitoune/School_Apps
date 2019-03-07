//
//  SecondViewController.swift
//  IOS_exe_files
//
//  Created by hackeru on 07/03/2019.
//  Copyright © 2019 hackeru. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var image: UIImageView!
    public var isRemembered = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        if isRemembered {
            readPicFromFile()
        }else{
            readPicFromServer()
        }
    }
    
    func readPicFromServer(){
        // connect to server
        // Show pic
        // save to file
        writePicToFile()
    }
    
    func readPicFromFile(){
        // read pic data from file
        
    }
    
    func writePicToFile(){
        // write pic data to file
    }
    
    func showPic(FromData data: Data) {
        image = UIImageView(frame: view.frame)
        image.image = UIImage(data: data)
        image.contentMode = .scaleAspectFit
        view.addSubview(image)
    }
}
