//
//  ViewController.swift
//  videoPlayer
//
//  Created by Sanak Ghosh on 4/23/21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var playerLayer = AVPlayerLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        videoPlayer()
    }

    func videoPlayer(){
        guard let path = Bundle.main.path(forResource: "WorldofScience",
                                          ofType: "mp4") else{
            return
        }
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = view.bounds
        playerLayer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(playerLayer)
        
        player.play()
    }
    
    override func viewWillTransition(to size: CGSize,
    with coordinator: UIViewControllerTransitionCoordinator) {
        playerLayer.frame = CGRect(x: 0, y: 0,
                                   width: size.width, height: size.height)
    }

}

