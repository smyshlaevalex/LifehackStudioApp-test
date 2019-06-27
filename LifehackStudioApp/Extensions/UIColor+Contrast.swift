//
//  UIColor+Contrast.swift
//  PixeLizedDraw
//
//  Created by Alexander Smyshlaev on 10/05/2019.
//  Copyright © 2019 Alexander. All rights reserved.
//

import UIKit

extension UIColor {
    var contrastColor: UIColor {
        return contrastRatio(with: .white) > contrastRatio(with: .black) ? .white : .black
    }
    
    var luminance: CGFloat {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: nil)
        
        return 0.2126 * adjusted(colorComponent: red) + 0.7152 * adjusted(colorComponent: green) + 0.0722 * adjusted(colorComponent: blue)
    }
    
    func contrastRatio(with color: UIColor) -> CGFloat {
        let selfLuminance = luminance
        let colorLuminance = color.luminance
        
        let darkerLuminance = min(selfLuminance, colorLuminance)
        let ligherLuminance = max(selfLuminance, colorLuminance)
        
        return (ligherLuminance + 0.05) / (darkerLuminance + 0.05)
    }
    
    private func adjusted(colorComponent: CGFloat) -> CGFloat {
        return (colorComponent < 0.03928) ? (colorComponent / 12.92) : pow((colorComponent + 0.055) / 1.055, 2.4)
    }
}
