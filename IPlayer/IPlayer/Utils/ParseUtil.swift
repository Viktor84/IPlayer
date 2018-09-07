//
//  ParseUtil.swift
//  IPlayer
//
//  Created by Mac on 9/8/18.
//  Copyright © 2018 Viktor Pechersky. All rights reserved.
//

import Foundation
import PromiseKit

class ParseUtil {
 
    class func parseTrackList(json: [String: Any]?) -> [Song]  {
        var arrSong = [Song]()
        
        if let data = json as? [String: Any],
            let arr = data["data"] as? [[String: Any]] {
            
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
                    arrSong.append(structSong)
                }
            }
        }
        return arrSong
    }
}
