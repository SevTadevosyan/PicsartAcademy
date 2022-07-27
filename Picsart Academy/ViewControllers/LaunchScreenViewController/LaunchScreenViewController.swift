//
//  LaunchScreenViewController.swift
//  Picsart Academy
//
//  Created by Sevak Tadevosyan on 20.06.22.
//

import UIKit
import AVKit

class LaunchScreenViewController: UIViewController {

    @IBOutlet weak var videoView: UIView!
    var playerManager = PlayerManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(self.view.frame.width)
        playerManager.configureLaunchScreenVideo(with: "launchVideo")
        configureVideo()
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        playerManager.playerLayer.frame = videoView.bounds
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        playerManager.player.seek(to: .zero)
        playerManager.player.play()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        playerManager.player.pause()
    }
    
    func configureVideo() {
        videoView.layer.addSublayer(playerManager.playerLayer)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(videoDidEnd),
                                               name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
                                               object: nil)
    }
    @objc func videoDidEnd() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "MyTabBarController")
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false)
    }
}
