//
//  UIGestureRecognizer.swift
//  PixeLizedDraw
//
//  Created by Alexander on 4/25/19.
//  Copyright © 2019 Alexander. All rights reserved.
//

import UIKit

extension UIGestureRecognizer {
    
    /// Cancels current gesture, sets state to .cancelled
    func cancel() {
        isEnabled = false
        isEnabled = true
    }
}
