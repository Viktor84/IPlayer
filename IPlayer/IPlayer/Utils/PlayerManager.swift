//
//  PlayerManager.swift
//  IPlayer
//
//  Created by Viktor Pechersky on 19.06.2018.
//  Copyright © 2018 Viktor Pechersky. All rights reserved.
//

import Foundation
import AVFoundation
import AVKit

class PlayerManager {
    
    static let sharedInstance = PlayerManager()
    private var currentSong: Song?
    private var player: AVPlayer?
    
    
    private init() {
        
    }
    
    func playWithSong(song: Song) {
        currentSong = song
        start()
    }
  
    func initWithSong(song: Song) {
        currentSong = song
        print ("RAKETA Song \(String(describing: song.previewSong))")
        //print ("RAKETA Song \(( currentSong?.previewSong))")
        //self.currentPlaySong = song
        //urlSE = URL(string: (currentSong?.previewSong)!)
    }
    
    func start() {
        guard let _song = currentSong else {
            return
        }
//        guard let url = URL(string: "https://s3.ap-south-1.amazonaws.com/aksharpatel47-static/positive_attitude.mp3")
//            else {
//            return
//        }
        let url = URL(string: _song.previewSong!)
        
        player = AVPlayer(url: url!)
        player?.play()
    }
    
    
    func pause() {
        player?.pause()
    }
    
    
    func stop() {
        currentSong = nil
        //player?.
    }
}

//@IBAction func pauseButton(_ sender: Any) {
//        if (playMusic == true) {
//           // playMusic = false
//            //self.player.pause()
//        }
//    }
//
////        if (playMusic == false) {
//            self.player.play()
//            playMusic = true
//            playStopButton.setImage(#imageLiteral(resourceName: "pause"), for: UIControlState.normal)
//        } else {
//            if (playMusic == true) {  // <--
//                self.player.pause()
//                playMusic = false
//                playStopButton.setImage(#imageLiteral(resourceName: "rewind8"), for: UIControlState.normal)
//            }
//        }
//    }






