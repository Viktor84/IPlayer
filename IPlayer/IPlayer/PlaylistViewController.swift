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
   //let track = 2
    
    
    @IBAction func SearchSong(_ sender: UIButton) {
        
        getTrackList()
         //let testReqest = Endpoint.appLocation
    }
    
    
    func getTrackList() {
        
        apiService.getAppLocation()
            .then { [weak self] json in
                print("get current location: ", json)
                if let value = json as? [String: Any],
                    let title = value["title"] as? [String],
                    let preview = value["level"] as? [String],
                    let name = value["location_tree"] as? [String] {
                    print("currentLocationID: ", title)
                    print("currentLevelID: ", preview)
                    print("currentLocationTree: ", name)
                    
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
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    
}
