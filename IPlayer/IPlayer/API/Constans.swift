//
//  Constans.swift
//  IPlayer
//
//  Created by Viktor Pechersky on 13.06.2018.
//  Copyright © 2018 Viktor Pechersky. All rights reserved.
//

import Foundation


final class Constants {
    static let scanInterval = 5
    
    #if DEBUG
    static let accessToken = "069d83499177a8c2611df68621be322cbd8cd4e111380fd0cdf9e1c202180c2a"
    //6401327bd3d61a2d159b376eeb72176ae5f7952b8d4bd9e5842ba31b7f6e9047"
    #else
    static let accessToken = "069d83499177a8c2611df68621be322cbd8cd4e111380fd0cdf9e1c202180c2a"
    #endif
}
