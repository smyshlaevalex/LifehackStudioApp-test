//
//  CompanyViewController.swift
//  LifehackStudioApp
//
//  Created by Alexander Smyshlaev on 27/06/2019.
//  Copyright © 2019 Alexander Smyshlaev. All rights reserved.
//

import UIKit

class CompanyViewController: UIViewController {
    private let company: Company
    
    init(company: Company) {
        self.company = company
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = company.name
        
        let textView: UITextView = makeView()
        textView.isEditable = false
        textView.text = company.description
        
        view.addSubview(textView)
        textView.constraintsToEdges(of: view).activate()
    }
}
