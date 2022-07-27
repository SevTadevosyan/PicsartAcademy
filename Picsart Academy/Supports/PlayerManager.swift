//
//  PlayerManager.swift
//  Picsart Academy
//
//  Created by Sevak Tadevosyan on 11.06.22.
//

import UIKit
import AVFoundation
import AVKit

class PlayerManager {
    
    var player: AVPlayer!
    var playerLayer: AVPlayerLayer!
    var playerLooper: AVPlayerLooper!
    
    func configureVideo() {
        let url: URL? = URL(string: "https://picsart.academy/web-video.mp4")
        if let url = url {
            player = AVPlayer(url: url)
        }
        playerLayer = AVPlayerLayer(player: player)
        playerLayer.videoGravity = .resize
        playerLayer.opacity = 1
        player.play()
    }
    func configureLaunchScreenVideo(with name: String) {
        
        guard let path = Bundle.main.path(forResource: "\(name)", ofType: "mp4") else {
            debugPrint("There is no such a video!")
            return
        }
        let url = URL(fileURLWithPath: path)
        let asset = AVAsset(url: url)
        let playerItem = AVPlayerItem(asset: asset)
        player = AVPlayer(playerItem: playerItem)
        playerLayer = AVPlayerLayer(player: player)
        playerLayer.videoGravity = .resize
        playerLayer.opacity = 1
        player.play()

    }
}
