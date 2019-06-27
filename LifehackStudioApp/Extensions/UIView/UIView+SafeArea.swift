//
//  UIView+SafeArea.swift
//  PixeLizedDraw
//
//  Created by Alexander on 3/9/19.
//  Copyright © 2019 Alexander. All rights reserved.
//

import UIKit

protocol LayoutGuideProvider {
    var leadingAnchor: NSLayoutXAxisAnchor { get }
    var trailingAnchor: NSLayoutXAxisAnchor { get }
    var leftAnchor: NSLayoutXAxisAnchor { get }
    var rightAnchor: NSLayoutXAxisAnchor { get }
    var topAnchor: NSLayoutYAxisAnchor { get }
    var bottomAnchor: NSLayoutYAxisAnchor { get }
    var widthAnchor: NSLayoutDimension { get }
    var heightAnchor: NSLayoutDimension { get }
    var centerXAnchor: NSLayoutXAxisAnchor { get }
    var centerYAnchor: NSLayoutYAxisAnchor { get }
}

extension UIView: LayoutGuideProvider { }
extension UILayoutGuide: LayoutGuideProvider { }

extension UIView {
    var safeLayoutGuide: LayoutGuideProvider {
        if #available(iOS 11, *) {
            return safeAreaLayoutGuide
        } else {
            return self
        }
    }
    
    var safeInsets: UIEdgeInsets {
        if #available(iOS 11, *) {
            return safeAreaInsets
        } else {
            return .zero
        }
    }
    
    var safeLayoutFrame: CGRect {
        if #available(iOS 11, *) {
            return safeAreaLayoutGuide.layoutFrame
        } else {
            return bounds
        }
    }
    
    var safeWidthAnchor: NSLayoutDimension {
        let safeWidthAnchor: NSLayoutDimension
        if #available(iOS 11, *) {
            safeWidthAnchor = safeLayoutGuide.widthAnchor
        } else {
            safeWidthAnchor = widthAnchor
        }
        
        return safeWidthAnchor
    }
    
    var safeHeightAnchor: NSLayoutDimension {
        let safeHeightAnchor: NSLayoutDimension
        if #available(iOS 11, *) {
            safeHeightAnchor = safeLayoutGuide.heightAnchor
        } else {
            safeHeightAnchor = layoutMarginsGuide.heightAnchor
        }
        
        return safeHeightAnchor
    }
}
