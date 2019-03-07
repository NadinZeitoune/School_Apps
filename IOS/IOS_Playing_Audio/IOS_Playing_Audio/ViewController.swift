//
//  ViewController.swift
//  IOS_Playing_Audio
//
//  Created by hackeru on 07/03/2019.
//  Copyright © 2019 hackeru. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate{
    
    var audioPlayer: AVAudioPlayer!
    var isReadyToPlay = false
    @IBOutlet weak var btnStart: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.global().async {[weak self] in
            let filePath = Bundle.main.path(forResource: "Cat", ofType: "mp3")!
            do {
                let url = URL(string: filePath)!
                self!.audioPlayer = try AVAudioPlayer(contentsOf: url)
                self!.audioPlayer.delegate = self
                self!.isReadyToPlay = self!.audioPlayer.prepareToPlay()
            } catch {
                print("error \(error)")
            }
        }
    }

    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        print("audioPlayerDidFinishPlaying \(flag)")
    }

    @IBAction func handleButtonStartClicked(_ sender: UIButton) {
        if audioPlayer.isPlaying {
            btnStart.setTitle("start", for: .normal)
            audioPlayer.stop()
        }else{
            if isReadyToPlay{
                audioPlayer.play()
                btnStart.setTitle("stop", for: .normal)
            }
        }
    }
}

