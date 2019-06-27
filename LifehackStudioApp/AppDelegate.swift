//
//  AppDelegate.swift
//  LifehackStudioApp
//
//  Created by Alexander Smyshlaev on 27/06/2019.
//  Copyright © 2019 Alexander Smyshlaev. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        
        let companiesReadService = CompaniesAPIReadService()
        let companyListViewController = CompanyListViewController(companiesReadService: companiesReadService)
        window.rootViewController = UINavigationController(rootViewController: companyListViewController)
        
        window.makeKeyAndVisible()
        
        return true
    }
}

