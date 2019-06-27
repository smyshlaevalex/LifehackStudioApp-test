//
//  UIViewController+Embed.swift
//  PixeLizedDraw
//
//  Created by Alexander on 2/12/19.
//  Copyright © 2019 Alexander. All rights reserved.
//

import UIKit

extension UIViewController {
    func embed(viewController: UIViewController, toView view: UIView) {
        addChild(viewController)
        view.addSubview(viewController.view)
        viewController.view.translatesAutoresizingMaskIntoConstraints = false
        viewController.view.constraintsToEdges(of: view).activate()
        
        viewController.didMove(toParent: self)
    }
    
    func unembed(viewController: UIViewController) {
        viewController.willMove(toParent: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParent()
    }
}
