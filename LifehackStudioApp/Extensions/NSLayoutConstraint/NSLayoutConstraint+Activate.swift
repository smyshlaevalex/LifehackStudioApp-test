//
//  NSLayoutConstraint+Activate.swift
//  AlarmClock
//
//  Created by Alexander on 11/30/18.
//  Copyright © 2018 Alexander Smyshlaev. All rights reserved.
//

import UIKit

extension NSLayoutConstraint {
    func activate() {
        isActive = true
    }
    
    func deactivate() {
        isActive = false
    }
    
    func activated() -> NSLayoutConstraint {
        isActive = true
        
        return self
    }
    
    func deactivated() -> NSLayoutConstraint {
        isActive = false
        
        return self
    }
}

extension Array where Element == NSLayoutConstraint {
    func activate() {
        NSLayoutConstraint.activate(self)
    }
    
    func deactivate() {
        NSLayoutConstraint.deactivate(self)
    }
    
    func activated() -> [Element] {
        NSLayoutConstraint.activate(self)
        
        return self
    }
    
    func deactivated() -> [Element] {
        NSLayoutConstraint.deactivate(self)
        
        return self
    }
}
