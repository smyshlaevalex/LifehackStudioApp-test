//
//  UIViewController+Anchors.swift
//  PixeLizedDraw
//
//  Created by Alexander on 3/10/19.
//  Copyright © 2019 Alexander. All rights reserved.
//

import UIKit

extension UIViewController {
    func safeTopAnchor(of view: UIView) -> NSLayoutYAxisAnchor {
        let safeTopAnchor: NSLayoutYAxisAnchor
        if #available(iOS 11, *) {
            safeTopAnchor = view.safeLayoutGuide.topAnchor
        } else {
            safeTopAnchor = topLayoutGuide.bottomAnchor
        }
        
        return safeTopAnchor
    }
    
    func safeBottomAnchor(of view: UIView) -> NSLayoutYAxisAnchor {
        let safeBottomAnchor: NSLayoutYAxisAnchor
        if #available(iOS 11, *) {
            safeBottomAnchor = view.safeLayoutGuide.bottomAnchor
        } else {
            safeBottomAnchor = bottomLayoutGuide.topAnchor
        }
        
        return safeBottomAnchor
    }
    
    var safeTopInset: CGFloat {
        let safeTopInset: CGFloat
        if #available(iOS 11, *) {
            safeTopInset = view.safeAreaInsets.top
        } else {
            safeTopInset = topLayoutGuide.length
        }
        
        return safeTopInset
    }
    
    var safeBottomInset: CGFloat {
        let safeBottomInset: CGFloat
        if #available(iOS 11, *) {
            safeBottomInset = view.safeAreaInsets.bottom
        } else {
            safeBottomInset = bottomLayoutGuide.length
        }
        
        return safeBottomInset
    }
    
    var safeLeftInset: CGFloat {
        let safeLeftInset: CGFloat
        if #available(iOS 11, *) {
            safeLeftInset = view.safeAreaInsets.left
        } else {
            safeLeftInset = 0
        }
        
        return safeLeftInset
    }
    
    var safeRightInset: CGFloat {
        let safeRightInset: CGFloat
        if #available(iOS 11, *) {
            safeRightInset = view.safeAreaInsets.right
        } else {
            safeRightInset = 0
        }
        
        return safeRightInset
    }
}
