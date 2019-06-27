//
//  CGImage+CIImage.swift
//  PixeLizedDraw
//
//  Created by Alexander on 3/24/19.
//  Copyright © 2019 Alexander. All rights reserved.
//

import UIKit

extension CGImage {
    static func cgImageFromCIImage(_ ciImage: CIImage) -> CGImage? {
        let cgImage: CGImage?
        
        let context = CIContext(options: nil)
        
        if let image = context.createCGImage(ciImage, from: ciImage.extent) {
            cgImage = image
        } else {
            cgImage = nil
        }
        
        return cgImage
    }
}
