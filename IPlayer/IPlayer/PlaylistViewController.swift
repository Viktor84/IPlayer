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



protocol PlaylistViewControllerDelegate: class {
    func moveToPlayerControler()
}

class PlaylistViewController: UIViewController{
    
    private let playerManager = PlayerManager.sharedInstance
    fileprivate let apiService = APIService.sharedInstance
    weak var delegate: PlaylistViewControllerDelegate?
    
    var arrSong = [Song]() {
        didSet {
            tabelView.reloadData()
        }
    }
    
    @IBOutlet weak var tabelView: UITableView!
    
    @IBAction func SearchSong(_ sender: UIButton) {
        //getTrackList()
    }
    
    @IBAction func Refresh(_ sender: UIButton) {
        
        let random = Int(arc4random_uniform(11) + 1)
        flag = true
        currentIndex = random
        getTrackList(index: random)
    }
    
    
    func getTrackList(index: Int) {
        apiService.getTrackList(index: index)
            .then { [weak self] json in
                
                var _arrSong = [Song]()
                if let data = json as? [String: Any],
                    let arr = data["data"] as? [[String: Any]]
                {
                    for dic in arr  {
                        
                        if let artist = dic["artist"] as? [String: Any],
                            let album = dic["album"] as? [String: Any] {
                            
                            var structSong = Song()
                            
                            structSong.pictureBig = album["cover_big"] as? String
                            structSong.titleShort = dic["title_short"] as? String
                            structSong.musicalGroup = artist["name"] as? String
                            structSong.titleSong = dic["title"] as? String
                            structSong.idSong = dic["id"] as? Int
                            structSong.previewSong = dic["preview"] as? String
                            
                            _arrSong.append(structSong)
                            
                        }
                    }
                    self?.arrSong = _arrSong
                }
                return AnyPromise(Promise())
            }
            .catch { [weak self] error in
                print("error: \(error)")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initTable()
        getTrackList(index: currentIndex)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func initTable() {
        tabelView.backgroundView = UIView(frame: .zero)
        tabelView.tableFooterView = UIView(frame: .zero)
    }
}


extension PlaylistViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        //var itemToMove = arrSong[sourceIndexPath.row]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}


extension PlaylistViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrSong.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! IPlayerTabelViewCell
        cell.delegate = self
        let curentSongLabel = arrSong[indexPath.row]
        cell.configure(song:curentSongLabel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}


extension PlaylistViewController: IPlayerTabelViewCellDelegate {
    func playSong(song: Song) {
        playerManager.playWithSong(song: song)
        delegate?.moveToPlayerControler()
    }
    
}
