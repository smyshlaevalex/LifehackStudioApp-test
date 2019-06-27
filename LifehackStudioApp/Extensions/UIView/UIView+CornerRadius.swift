//
//  UIView+CornerRadius.swift
//  AlarmClock
//
//  Created by Alexander on 11/30/18.
//  Copyright © 2018 Alexander Smyshlaev. All rights reserved.
//

import UIKit

extension UIView {
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        
        set {
            layer.masksToBounds = true
            layer.cornerRadius = newValue
        }
    }
    
    func applyRoundingMask(toCorners corners: UIRectCorner, radius: CGFloat) {
        let rectSize: CGSize
        if bounds.size == CGSize.zero {
            rectSize = systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        } else {
            rectSize = bounds.size
        }
        
        let path = UIBezierPath(roundedRect: CGRect(origin: .zero, size: rectSize),
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        
        layer.masksToBounds = true
        layer.mask = mask
    }
}
