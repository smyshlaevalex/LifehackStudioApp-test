//
//  CompaniesReadService.swift
//  LifehackStudioApp
//
//  Created by Alexander Smyshlaev on 27/06/2019.
//  Copyright © 2019 Alexander Smyshlaev. All rights reserved.
//

import Foundation

protocol CompaniesReadService {
    func allCompanies(completion: @escaping (Result<[CompactCompany], Error>) -> Void)
    func company(withId id: Int, completion: @escaping (Result<Company, Error>) -> Void)
}
