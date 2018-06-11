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
            return .post
        }
    }
    
    //TODO: NSURL.getBaseUrl() depends on dev/prod
    var url: String {
        #if DEBUG
        let baseUrl = "https://apidev.trakkers.net.au"
        #else
        let baseUrl = "https://secureapi.trakkers.net.au"
        #endif
        
        switch self {
        case .appLocation:
            return baseUrl + "/locations/app-location"
        case .requestinfo:
            return baseUrl + "/leads"
        }
    }
}
