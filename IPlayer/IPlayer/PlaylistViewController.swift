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

class PlaylistViewController: UITableViewController{
    
    fileprivate let apiService = APIService.sharedInstance

    @IBAction func SearchSong(_ sender: UIButton) {
        
        getTrackList()
         //let testReqest = Endpoint.appLocation
    }
    
    
    func getTrackList() {
        
        apiService.getAppLocation()
            .then { [weak self] json in
                print("get current location: ", json)
                if let data = json as? [String: Any],
                let arr = data["data"] as? [[String: Any]]
                {
                    
                    for title in arr  {
                        print ("FOR ||  !========:   !!!  \(title)!")
                    }
                    
                    for preview in arr  {
                        //print ("FOR  and  PREVIEW ||  !========:   !!!  \(preview)!")
                    }
// Пример !
//                    let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
//                    for (animalName, legCount) in numberOfLegs {
//                        print("\(animalName)s have \(legCount) legs")
//                    }
//                    // ants have 6 legs
//                    // cats have 4 legs
//                    // spiders have 8 legs
                    
                    
                print("data: ||  ============: ", data)
                print("arr: ||  ============: ", arr)
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
