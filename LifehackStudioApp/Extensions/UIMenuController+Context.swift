//
//  UIMenuController+Context.swift
//  PixeLizedDraw
//
//  Created by Alexander on 4/16/19.
//  Copyright © 2019 Alexander. All rights reserved.
//

import UIKit


extension UIMenuController {
    private static var contextKey: UInt8 = 0
    
    var context: Any? {
        get {
            return objc_getAssociatedObject(self, &UIMenuController.contextKey)
        }
        
        set {
            objc_setAssociatedObject(self, &UIMenuController.contextKey, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
}
