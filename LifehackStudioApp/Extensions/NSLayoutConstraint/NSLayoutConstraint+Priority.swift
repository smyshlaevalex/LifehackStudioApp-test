//
//  NSLayoutConstraint+Priority.swift
//  AlarmClock
//
//  Created by Alexander on 12/10/18.
//  Copyright © 2018 Alexander Smyshlaev. All rights reserved.
//

import UIKit

extension NSLayoutConstraint {
    func withPriority(_ priority: UILayoutPriority) -> NSLayoutConstraint {
        self.priority = priority
        
        return self
    }
}

extension Array where Element == NSLayoutConstraint {
    func withPriority(_ priority: UILayoutPriority) -> [NSLayoutConstraint] {
        forEach { $0.priority = priority }
        
        return self
    }
}
