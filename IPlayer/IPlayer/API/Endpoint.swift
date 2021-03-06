//
//  Endpoint.swift
//  IPlayer
//
//  Created by Viktor Pechersky on 31.05.2018.
//  Copyright © 2018 Viktor Pechersky. All rights reserved.
//

import Foundation
import Alamofire




enum Endpoint {
    case getTrackList(index: Int)
    case requestinfo
    
    // MARK: - Public Properties
    var method: HTTPMethod {
        switch self {
        case .getTrackList,
             .requestinfo:
            return .get
        }
    }
    
    //TODO: NSURL.getBaseUrl() depends on dev/prod
    var url: String {
        
        let baseUrl = "https://api.deezer.com"
        switch self {
        case .getTrackList(let index):
            return baseUrl + "/artist/\(index)/top?limit=50"
        case .requestinfo:
            return baseUrl + "/leads"
        }
    }
}
