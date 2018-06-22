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
    private var _currentSong: Song?
    var currentSong: Song? {
        get {
            return _currentSong
        }
    }
    private var player: AVPlayer?
    
    
    private init() {
        
    }
    
    func playWithSong(song: Song) {
        _currentSong = song
        start()
    }
  
    func initWithSong(song: Song) {
        _currentSong = song
    }
    
    func start() {
        guard let _song = _currentSong else {
            return
        }
 
        let url = URL(string: _song.previewSong!)
        
        player = AVPlayer(url: url!)
        player?.play()
    }
    
    func continuePlay() {
        player?.play()
    }
    
    func pause() {
        player?.pause()
    }
    
    func isPlaying() -> Bool {
        return player?.timeControlStatus == AVPlayerTimeControlStatus.playing || player?.timeControlStatus == AVPlayerTimeControlStatus.waitingToPlayAtSpecifiedRate
    }
    
    func isPaused() -> Bool {
        return player?.timeControlStatus == AVPlayerTimeControlStatus.paused
    }
    
    func stop() {
        _currentSong = nil
        player?.pause()
        player = nil
    }
}










