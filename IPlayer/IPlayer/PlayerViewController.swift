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

class PlayerViewController: UIViewController {
    
    @IBOutlet weak var sliderBoard: UISlider!
    var player = AVAudioPlayer()
    var slider = UISlider()
    var playMusic = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Slider
        //sliderBoard.maximumValue = Float(player.duration)
        //var timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: Selector(("updateSlaider")), userInfo: nil, repeats: true)
        
        do {
            if let auduoPath = Bundle.main.path(forResource: "sting-fields_of_gold", ofType: "mp3") {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: auduoPath))
            //self.slider.maximumValue = Float(player.duration)
            }
        } catch {
            print ("ERROR!")
        }
        //self.player.play()
        sliderBoard.maximumValue = Float(player.duration)
        
        //var timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: Selector("updateSlaider"), userInfo: nil, repeats: true)
    }
    
    
    //MARK: - ACtion
    @IBAction func playButton(_ sender: Any) {
        if (playMusic == false) {
        self.player.play()
        playMusic = true
        } else {
            if (playMusic == true) {  // <--
                self.player.pause()
                playMusic = false
            }
        }
    }
    
    @IBAction func pauseButton(_ sender: Any) {
        if (playMusic == true) {
           // playMusic = false
            //self.player.pause()
        }
    }
    
    @IBAction func sliderAction(_ sender: Any) {
        
        player.stop()
        player.currentTime = TimeInterval(sliderBoard.value)
        player.prepareToPlay()
        player.play()
    }
    
    func updateSlaider(){
        
        sliderBoard.value = Float(player.currentTime)
        NSLog("HI")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

}
