//
//  PlayerView.swift
//  IPlayer
//
//  Created by Viktor Pechersky on 04.05.2018.
//  Copyright © 2018 Viktor Pechersky. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
import AVKit
import SDWebImage

class PlayerViewController: UIViewController {
    
    
    private let playerManager = PlayerManager.sharedInstance
    
    
    @IBOutlet weak var playStopButton: UIButton!
    @IBOutlet weak var sliderBoard: UISlider!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var songLabel: UILabel!
    @IBOutlet weak var musicalGroupLabel: UILabel!
    
    var slider = UISlider()
    var playMusic = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updatePlayerInfo()
        updatePlayerUI()
    }
    
    private func updatePlayerInfo() {
        guard let _currentSong = playerManager.currentSong else {
            return
        }
        
        if let _pictureBig = _currentSong.pictureBig  {
            imageView.sd_setImage(with: URL(string: _pictureBig), placeholderImage: UIImage(named: "placeholder"))
        } else {
            imageView.image = UIImage(named: "placeholder")
        }
        
        songLabel.text = _currentSong.titleSong  
        musicalGroupLabel.text = _currentSong.musicalGroup
    }
    
    
    private func updatePlayerUI() {
        if playerManager.isPlaying() {
            playStopButton.setImage(#imageLiteral(resourceName: "pause"), for: UIControlState.normal)
        } else {
            playStopButton.setImage(#imageLiteral(resourceName: "rewind8"), for: UIControlState.normal)
        }
    }
    
    @IBAction func playButton(_ sender: Any) {
        guard let _currentSong = playerManager.currentSong else {
            return
        }
        if playerManager.isPlaying() {
            playerManager.pause()
        } else if playerManager.isPaused() {
            playerManager.continuePlay()
        } else {
            playerManager.start()
        }
        
        updatePlayerUI()
        
    }
    
    func cleanData() {
        imageView.sd_cancelCurrentImageLoad()
        imageView.image = nil
    }
    
    deinit {
        //cleanData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
}
