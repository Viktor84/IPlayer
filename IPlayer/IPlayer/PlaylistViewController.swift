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

protocol PlaylistViewControllerDelegate: class {
    func moveToPlayerControler()
}

class PlaylistViewController: UIViewController{
    
    fileprivate let apiService = APIService.sharedInstance
    weak var delegate: PlaylistViewControllerDelegate?

    @IBOutlet weak var tabelView: UITableView!
    
    @IBAction func SearchSong(_ sender: UIButton) {
        //getTrackList()
    }
    

    func getTrackList() {
        apiService.getAppLocation()
            .then { [weak self] json in
                //print("get current location: ", json)
                if let data = json as? [String: Any],
                let arr = data["data"] as? [[String: Any]]
                    
                {
                    for dic in arr  {
                        var i = 0
                        print ("FOR start ||  ! ============================  : ")
                        print ("FOR ||  ! ======  : \(dic)!")
                       
                            let artist = dic["artist"] as? [String: Any]
                        artist!["name"]
                        print ("artist name == > \(artist!["name"])!")
                        
                        let album = dic["album"] as? [String: Any]
                        album!["cover_big"]
                        print ("album cover_big === > \(album!["cover_big"]) !!!")
                        
                        
                        dic["title_short"]
                        print ("dic title_short = > \(dic["title_short"])!!!")
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
                        
                        structSong.pictureBig = album!["cover_big"] as? String
                        structSong.titleShort = dic["title_short"] as? String
                        structSong.musicalGroup = artist!["name"] as? String
                        structSong.titleSong = dic["title"] as? String
                        structSong.idSong = dic["id"] as? Int
                        structSong.previewSong = dic["preview"] as? String

                        print ("STRUCT  \(structSong.titleShort)!")
                        print ("STRUCT  \(structSong.musicalGroup)!")
                        print ("STRUCT  \(structSong.titleSong)!")
                        print ("STRUCT  \(structSong.idSong)!")
                        print ("STRUCT  \(structSong.previewSong)!")
                        
                   
                        //arrSong.insert(contentsOf:[structSong], at: i)
                        
                        arrSong.append(structSong)
                        
                        print ("STR REST   \(arrSong)")
                    }
                        //print ("STR current   \(arrSong[i])")
//                        var arraySong = [structSong]
//                        arraySong[0].titleSong = dic["title"] as? String
//                        arraySong[0].idSong = dic["id"] as? String
//                        arraySong[0].previewSong = dic["preview"] as? String
//
//                        print ("STRUCT  \(arraySong[0].titleSong)!")
//                        print ("STRUCT  \(arraySong[0].idSong)!")
//                        print ("STRUCT  \(arraySong[0].previewSong)!")
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
        getTrackList()
        tabelView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //tabelView.reloadData()
    }
}


extension PlaylistViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        //var itemToMove = arrSong[sourceIndexPath.row]
        //arrSong.remove(at: sourceIndexPath.row)
        //arrSong.insert(itemToMove, at: destinationIndexPath.row)
        //coreDataManager.updateEquipmentOrders(arrDeviceType: deviceTypes)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.moveToPlayerControler()
    }
}

extension PlaylistViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrSong.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! IPlayerTabelViewCell
        
        let curentSongLabel = arrSong[indexPath.row]
        cell.configure(song:curentSongLabel)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}

