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
    //@IBOutlet weak var dataLabel: UILabel!
    var dataObject: UIViewController?  // dataObject ?
    
    var player = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            if let auduoPath = Bundle.main.path(forResource: "daft-punk-robot-rock", ofType: "mp3") {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: auduoPath))
            }
        } catch {
            print ("ERROR")
        }
        //self.player.play()
    }
    
    //MARK: - ACtion
    @IBAction func playButton(_ sender: Any) {
        self.player.play()
    }
    
    @IBAction func pauseButton(_ sender: Any) {
        self.player.pause()
    }
    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //self.dataLabel!.text = dataObject
    }
    
    
}
