//
//  ViewController.swift
//  IOS_Playing_Video
//
//  Created by hackeru on 07/03/2019.
//  Copyright © 2019 hackeru. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    var moviePlayer: AVPlayerViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moviePlayer = AVPlayerViewController(nibName: nil, bundle: nil)
        let url = Bundle.main.url(forResource: "video", withExtension: "mp4")!
        moviePlayer.player = AVPlayer(url: url)
    }
    
    @IBAction func handlePlayClicked(_ sender: UIButton) {
        present(moviePlayer, animated: true, completion: nil)
        moviePlayer.player!.play()
    }
}

