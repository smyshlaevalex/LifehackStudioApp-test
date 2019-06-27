//
//  CompanyEndpoint.swift
//  LifehackStudioApp
//
//  Created by Alexander Smyshlaev on 27/06/2019.
//  Copyright © 2019 Alexander Smyshlaev. All rights reserved.
//

import Foundation

enum CompanyEndpoint: APIEndpoint {
    case allCompanies
    case company(id: Int)
    
    var url: URL {
        let url: URL
        switch self {
        case .allCompanies:
            url = URL(string: "http://megakohz.bget.ru/test.php")!
        case .company(let id):
            url = URL(string: "http://megakohz.bget.ru/test.php?id=\(id)")!
        }
        
        return url
    }
}
