//
//  Color.swift
//  SwiftNews
//
//  Created by DarkMoon on 03/11/22.
//

import Foundation
import UIKit

enum MyColor {
    case InActiveStatus
    case ActiveStatus
    case DocAcppblue
    case DocAppTopNavbarColor

    
}

extension MyColor {
    var value: UIColor {
        get {
            switch self {
            case .InActiveStatus:
                return UIColor(red: 2/255, green: 191/255, blue: 55/255, alpha: 1.0)
            case .ActiveStatus:
                return UIColor(red: 176/255, green: 1/255, blue: 1/255, alpha: 1.0)
            case .DocAcppblue:
                return UIColor(red: 62/255, green: 100/255, blue: 255/255, alpha: 1.0)
            case .DocAppTopNavbarColor:
                return UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1.0)

            }
            
        }
    }
}
