//
//  CustomView.swift
//  EmployeeTraker
//
//  Created by DarkMoon on 18/12/22.
//

import Foundation
import UIKit


var max : CGFloat?
var corners : UIRectCorner = []

@IBDesignable extension UIView {
    func setCorner(newValue: Bool, for corner: UIRectCorner) {
        if newValue {
            addRectCorner(corner: corner)
        } else {
            removeRectCorner(corner: corner)
        }
    }
    
    var cornerRadiusValue:CGFloat {
        get {
            return max ?? 0
        }
        set(newValue) {
            max = newValue
        }
    }
    
    func addRectCorner(corner: UIRectCorner) {
        
        corners.insert(corner)
        updateCorners()
    }
    
    func removeRectCorner(corner: UIRectCorner) {
        if corners.contains(corner) {
            corners.remove(corner)
            updateCorners()
        }
    }
    
    func updateCorners() {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: cornerRadiusValue, height: cornerRadiusValue))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    @IBInspectable var shadowRadius: CGFloat {
        get { return layer.shadowRadius }
        set { layer.shadowRadius = newValue }
    }
    
    
    
    @IBInspectable private var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.masksToBounds = newValue > 0
            layer.cornerRadius = newValue
        }
    }
    
    
    @IBInspectable var shadowOpacity: CGFloat {
        get { return CGFloat(layer.shadowOpacity) }
        set { layer.shadowOpacity = Float(newValue) }
    }
    
    @IBInspectable var shadowOffset: CGSize {
        get { return layer.shadowOffset }
        set { layer.shadowOffset = newValue }
    }
    
    @IBInspectable var shadowColor: UIColor? {
        get {
            guard let cgColor = layer.shadowColor else {
                return nil
            }
            return UIColor(cgColor: cgColor)
        }
        set { layer.shadowColor = newValue?.cgColor }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            guard let cgColor = layer.borderColor else {
                return nil
            }
            return UIColor(cgColor: cgColor)
        }
        set { layer.borderColor = newValue?.cgColor }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
}

extension UIView {
    
    func roundCorners(radius: CGFloat , corners: UIRectCorner = .allCorners) {
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
        if #available(iOS 11.0, *) {
            var arr: CACornerMask = []
            
            let allCorners: [UIRectCorner] = [.topLeft, .topRight, .bottomLeft, .bottomRight, .allCorners]
            
            for corn in allCorners {
                if(corners.contains(corn)){
                    switch corn {
                    case .topLeft:
                        arr.insert(.layerMinXMinYCorner)
                    case .topRight:
                        arr.insert(.layerMaxXMinYCorner)
                    case .bottomLeft:
                        arr.insert(.layerMinXMaxYCorner)
                    case .bottomRight:
                        arr.insert(.layerMaxXMaxYCorner)
                    case .allCorners:
                        arr.insert(.layerMinXMinYCorner)
                        arr.insert(.layerMaxXMinYCorner)
                        arr.insert(.layerMinXMaxYCorner)
                        arr.insert(.layerMaxXMaxYCorner)
                    default: break
                    }
                }
            }
            self.layer.maskedCorners = arr
        } else {
            self.roundCornersBezierPath(corners: corners, radius: radius)
        }
    }
    
    private func roundCornersBezierPath(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
}

