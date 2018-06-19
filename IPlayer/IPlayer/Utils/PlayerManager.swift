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
    
    
   // var currentPlaySong = Song.previewSong
    
    func initWithSong(song: Song) {
        //currentSong = song
        currentSong = song
        //print ("RAKETA Song \(String(describing: song.previewSong))")
        //print ("RAKETA Song \(( currentSong?.previewSong))")
        //self.currentPlaySong = song
    }
    
    func start() {
//        guard let _song = currentSong else {
//            return
//        }
        //guard let url = URL(string: )
        guard let url = URL(string: "https://s3.ap-south-1.amazonaws.com/aksharpatel47-static/positive_attitude.mp3")
            else {
            return
        }
        player = AVPlayer(url: url)// _song.previewSong
        player?.play()
    }
    
    func stop() {
        currentSong = nil
        //player?.
    }
        
        
    

}
