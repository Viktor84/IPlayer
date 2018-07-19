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
import JaneSliderControl



class PlayerViewController: UIViewController {
    
    class UICustomView: UIView, PlayerBlockDisplayable {}
    
    private let playerManager = PlayerManager.sharedInstance
    @IBOutlet weak var bottomBlockView: UICustomView!
    @IBOutlet weak var playStopButton: UIButton!
    @IBOutlet weak var sliderBoard: UISlider!
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
    
            imageView.layer.shadowColor = UIColor.black.cgColor
            imageView.layer.shadowOpacity = 1
            imageView.layer.shadowOffset = CGSize.zero
            imageView.layer.shadowRadius = 10
            imageView.layer.shadowPath = UIBezierPath(rect: imageView.bounds).cgPath
            imageView.layer.shouldRasterize = true
//            imageView.clipsToBounds = true
//            imageView.layer.shadowColor = UIColor.red.cgColor
//            imageView.layer.shadowOpacity = 1.0
//            imageView.layer.shadowOffset = CGSize.zero
//            imageView.layer.shadowRadius = 4
//            imageView.layer.shadowPath = UIBezierPath(rect: imageView.bounds).cgPath
//            imageView.layer.shouldRasterize = false
//            imageView.layer.borderWidth = 1
//            imageView.layer.borderColor = UIColor.lightGray.cgColor
        }
    }
    @IBOutlet weak var songLabel: UILabel!
    @IBOutlet weak var musicalGroupLabel: UILabel!
    
    @IBOutlet weak var customControl: SliderControl!
    

    
    
    var slider = UISlider()
    var playMusic = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bottomBlockView.displayAsGradientView()
        updatePlayerInfo()
        updatePlayerUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if let gradient = bottomBlockView.layer.sublayers?[0] as? CAGradientLayer {
            gradient.frame = bottomBlockView.bounds
        }
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
