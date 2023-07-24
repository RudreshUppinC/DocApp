//
//  UIView.swift
//  SwiftNews
//
//  Created by DarkMoon on 04/11/22.
//

import UIKit

extension UIView {

    func addShadow(shadowColor: CGColor = UIColor.gray.cgColor,
                   shadowOffset: CGSize = CGSize(width: 0, height: -3),
                   shadowOpacity: Float = 0.6,
                   shadowRadius: CGFloat = 3,
                   cornerRadius: CGFloat = 20.0,
                   maskedCorners: CACornerMask =  [.layerMaxXMinYCorner, .layerMinXMinYCorner]) {
        layer.shadowColor = shadowColor
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
        layer.cornerRadius = cornerRadius
        layer.maskedCorners = maskedCorners

    }
    
    func addDropDownAnimate(viewHeightConstraint: NSLayoutConstraint, constant: CGFloat) {
            UIView.animate(withDuration: 0.50, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: [], animations: {
                viewHeightConstraint.constant = constant
                self.layoutIfNeeded()
            }, completion: nil)
    }
    
    func showAnimation(_ completionBlock: @escaping ((Bool) -> Void)) {
        
        isUserInteractionEnabled = false
        UIView.animate(withDuration: 0.02,
                       delay: 0,
                       options: .curveLinear,
                       animations: { [weak self] in
            self?.transform = CGAffineTransform.init(scaleX: 0.75, y: 0.75)
        }) {  (done) in
            UIView.animate(withDuration: 0.1,
                           delay: 0,
                           options: .curveLinear,
                           animations: { [weak self] in
                self?.transform = CGAffineTransform.init(scaleX: 1, y: 1)
            }, completion: { (finish: Bool) in
                // do stuff once animation is complete
                self.isUserInteractionEnabled = true
                completionBlock(finish)
            })
        }
    }
    
}

