//
//  MakeView.swift
//  PixeLizedDraw
//
//  Created by Alexander on 2/13/19.
//  Copyright © 2019 Alexander. All rights reserved.
//

import UIKit

func makeView<View: UIView>(_ view: View = View(), useAutoresizingMask: Bool = false, _ block: ((View) -> Void)? = nil) -> View {
    view.translatesAutoresizingMaskIntoConstraints = useAutoresizingMask
    
    block?(view)
    
    return view
}
