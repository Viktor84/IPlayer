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

class PlayerViewController: UIViewController {
    
    
    var player: AVPlayer?  //pjA81zY4QQmshef46JVPPON78KRNp1UjWhTjsn0JJz3yacI24f
    
    func playUsingAVPlayer(url: URL) {
        player = AVPlayer(url: url)
        player?.play()
    }
    
    @IBAction func playRemoteFile(_ sender: UIButton) {
        guard let url = URL(string: "https://s3.ap-south-1.amazonaws.com/aksharpatel47-static/positive_attitude.mp3")
        //guard let url = URL(string: "https://cdns-preview-5.dzcdn.net/stream/c-5197e65a6c91f81735c989c79d5b34e2-4.mp3")
            else {
            print("Invalid URL")
            return
        }
        playUsingAVPlayer(url: url)
    }
    
     

    @IBOutlet weak var playStopButton: UIButton!
    @IBOutlet weak var sliderBoard: UISlider!
    //var player = AVAudioPlayer()
    var slider = UISlider()
    //var playMusic = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let baseURL = URL(string: "https://deezerdevs-deezer.p.mashape.com/")
        let fullURL = URL(string: "artist/1", relativeTo: baseURL)//URL(string: "artist/1", relativeTo: baseURL)//
        
        let sessionconfiguration = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionconfiguration)
        
        let request = URLRequest(url: fullURL!)
        let dataTask = session.dataTask(with: fullURL!) { (data, response, error) in
            
        }
        dataTask.resume()
    }
        //Slider
        //sliderBoard.maximumValue = Float(player.duration)
        //var timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: Selector(("updateSlaider")), userInfo: nil, repeats: true)
        
       /* version 1 do {
            if let auduoPath = Bundle.main.path(forResource: "sting-fields_of_gold", ofType: "mp3") {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: auduoPath)) 
                /*var audioSession = AVAudioSession.sharedInstance() // example in video https://www.youtube.com/watch?v=dqad3XuMwHI
                do {
                //try audioSession.setCategory(AVAudioSessionCategoryPlayback)
                } catch{
                    }*/
                
            }
        } catch {
            print ("ERROR!")
        }
       */
        
        //NSLog ("   ||   PlayerViewController")
        
        //    || WORK Version !
//        do {
//            player = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "sting-fields_of_gold", ofType: "mp3")!))
//            player.prepareToPlay()
//
//            var audioSession = AVAudioSession.sharedInstance()
//
//            do {
//                try audioSession.setCategory(AVAudioSessionCategoryPlayback)
//            }
//            catch {
//            }
//        }
//        catch {
//            print(error)
//
//        }
//    }
//        let url = NSURL(string: "https://itunes.apple.com/us/album/better-together/879273552?i=879273565&uo=4")
//        let item = AVPlayerItem(URL: url)
//        let p = AVPlayer(playerItem: item)
//        p.play()
        
 /*  11.06.2018     do {
                        player = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath:Bundle.main.path(forResource: "sting-fields_of_gold", ofType: "mp3")!))
                       player.prepareToPlay()
           
                        //var audioSession = AVAudioSession.sharedInstance()
            
                        do {
                            //try audioSession.setCategory(AVAudioSessionCategoryPlayback)
                        }
                        catch {
                        }
                    }
                    catch {
                        print(error)
            
                    }
                }*/
        
       
    

        
        
    //do {
            //try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            //print("AVAudioSession Category Playback OK")
           // do {
            //    try AVAudioSession.sharedInstance().setActive(true)
            //    print("AVAudio is Active")
            //} catch let error as NSError {
            //    print(error.localizedDescription)
            //} catch let error as NSError {
            //    print(error.localizedDescription)
            //}
        //}
        
        /*var audioSession = AVAudioSession.sharedInstance() // example in video https://www.youtube.com/watch?v=dqad3XuMwHI
         do {
         //try audioSession.setCategory(AVAudioSessionCategoryPlayback)
         } catch{
         }*/
        
//        let session = AVAudioSession.sharedInstance()
//        
//        do {
//            try session.setCategory(AVAudioSessionCategoryPlayback)
//        }
//        catch {
//        
//        }
//       //self.player.play()
    //sliderBoard.maximumValue = Float(player.duration)
//    }
//    
    
    /*do {
    try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
    print("AVAudioSession Category Playback OK")
    do {
    try AVAudioSession.sharedInstance().setActive(true)
    print("AVAudio is Active")
    } catch let error as NSError {
    print(error.localizedDescription)
    } catch let error as NSError {
    print(error.localizedDescription)
    }
    }*/
    
    
    //MARK: - ACtion
   /* @IBAction func playButton(_ sender: Any) {
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
    */
//    @IBAction func pauseButton(_ sender: Any) {
//        if (playMusic == true) {
//           // playMusic = false
//            //self.player.pause()
//        }
//    }
//
//
//
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
//
    
    
//    @IBAction func sliderAction(_ sender: Any) {
//
//        //player.stop()
//       //player.currentTime = TimeInterval(sliderBoard.value)
//        //player.prepareToPlay()
//        player.play()
//    }
//
//    func updateSlaider(){
//
//        //sliderBoard.value = Float(player.currentTime)
//        NSLog("HI")
//
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//    }
//
}
