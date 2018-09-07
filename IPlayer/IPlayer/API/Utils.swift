//
//  Utils.swift
//  IPlayer
//
//  Created by Viktor Pechersky on 13.06.2018.
//  Copyright © 2018 Viktor Pechersky. All rights reserved.
//

import Foundation

final class Utils {
    
    class func cutomError(code: Int, message: String) -> NSError {
        return NSError(domain: "IPlayer", code: code, userInfo: [NSLocalizedDescriptionKey : message])
    }
}
