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
    case appLocation
    case requestinfo
    
    // MARK: - Public Properties
    var method: HTTPMethod {
        switch self {
        case .appLocation,
             .requestinfo:
            return .get
        }
    }
    
    //TODO: NSURL.getBaseUrl() depends on dev/prod
    var url: String {
        
        let baseUrl = "https://api.deezer.com"
        
        
        switch self {
        case .appLocation:
            return baseUrl + "/artist/1/top?limit=10"  // number = 50
        case .requestinfo:
            return baseUrl + "/leads"
        }
    }
}
