//
//  UIStoryboard.swift
//  docappGlobal
//
//  Created by DarkMoon on 02/04/23.
//

import Foundation
import UIKit

extension UIStoryboard {
    static func instantiateViewController<T: UIViewController>(withIdentifier identifier: String, fromStoryboardNamed storyboardName: String = "Main") -> T {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: identifier) as? T else {
            fatalError("Unable to instantiate view controller with identifier: \(identifier)")
        }
        return viewController
    }
}
