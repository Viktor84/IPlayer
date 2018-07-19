

import Foundation
import UIKit

extension UIColor {
        
        enum AppColor : Int {
            case studioApprox = 0x743ebd
            case cornflowerBlueApprox = 0x5469f9
            
            case DaisyBushApprox = 0x502aa6

        }

        convenience init(rgbValue: Int) {
            let red   = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
            let green = CGFloat((rgbValue & 0xFF00) >> 8) / 255.0
            let blue  = CGFloat(rgbValue & 0xFF) / 255.0

            self.init(red: red, green: green, blue: blue, alpha: 1.0)
        }

        convenience init(named name: AppColor) {
            self.init(rgbValue: name.rawValue)
        }
}
