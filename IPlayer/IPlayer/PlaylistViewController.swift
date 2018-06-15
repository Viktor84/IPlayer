//
//  PlaylistViewController.swift
//  IPlayer
//
//  Created by Viktor Pechersky on 04.05.2018.
//  Copyright © 2018 Viktor Pechersky. All rights reserved.
//

import Foundation
import UIKit
import PromiseKit

var arrSong = [Song]()

class PlaylistViewController: UITableViewController{
    
    fileprivate let apiService = APIService.sharedInstance

 
    @IBAction func SearchSong(_ sender: UIButton) {
        getTrackList()
    }
    
//    @IBAction func SearchSong(_ sender: UIButton) {
//        getTrackList() //let testReqest = Endpoint.appLocation
//    }

    
    
    
    func getTrackList() {
        apiService.getAppLocation()
            .then { [weak self] json in
                //print("get current location: ", json)
                if let data = json as? [String: Any],
                let arr = data["data"] as? [[String: Any]]
                    
                {
                    //let songDic = arr[0]

                    for dic in arr  {
                        print ("FOR start ||  ! ============================  : ")
                        //print ("FOR ||  ! ======  : \(dic)!")
                            dic["title"]
                        print ("dic title === > \(dic["title"])!")
                            dic["id"]
                        print ("dic ID === > \(dic["id"])!")
                        dic["preview"]
                        print ("dic preview === > \(dic["preview"])!")
                        print ("FOR end ||  ! ============================  : ")

                        
//                        struct Song {
//                            var titleSong: String?
//                            var idSong: String?
//                            var previewSong: String?
//                        }
//                       
                        //var arraySong = [Song]()
                        //arraySong.titleSong = dic["title"] as? String
                        //arraySong[0].idSong = dic["id"] as? String
                        //arraySong[0].previewSong = (dic["preview"] as? String)
                   
                        var structSong = Song()
                        
                        structSong.titleSong = dic["title"] as? String
                        structSong.idSong = dic["id"] as? String
                        structSong.previewSong = dic["preview"] as? String

                        print ("STRUCT  \(structSong.titleSong)!")
                        print ("STRUCT  \(structSong.idSong)!")
                        print ("STRUCT  \(structSong.previewSong)!")
                        
                        
//                        var arraySong = [structSong]
//                        arraySong[0].titleSong = dic["title"] as? String
//                        arraySong[0].idSong = dic["id"] as? String
//                        arraySong[0].previewSong = dic["preview"] as? String
//
//                        print ("STRUCT  \(arraySong[0].titleSong)!")
//                        print ("STRUCT  \(arraySong[0].idSong)!")
//                        print ("STRUCT  \(arraySong[0].previewSong)!")
                    }
                
                    //print("data: ||  ============: ", data)
                    //print("arr: ||  ============: ", arr)
                //print("currentLevelID: ", preview)
                  //  print("currentLocationTree: ", name)
                    //                        self?.title = title
                    //                        self?.preview = preview
                    //                        self?.name = name
                    //                        self?.isAbleToDetermine = true
                    
                    //self?.updateUI() // обновляем дааные в таблице
                }
                return AnyPromise(Promise())
            }
            .catch { [weak self] error in
                print("error: \(error)")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    
}
