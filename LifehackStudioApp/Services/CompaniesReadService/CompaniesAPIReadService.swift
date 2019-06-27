//
//  CompaniesAPIReadService.swift
//  LifehackStudioApp
//
//  Created by Alexander Smyshlaev on 27/06/2019.
//  Copyright © 2019 Alexander Smyshlaev. All rights reserved.
//

import Foundation

class CompaniesAPIReadService: CompaniesReadService {
    func allCompanies(completion: @escaping (Result<[CompactCompany], Error>) -> Void) {
        APIGetService<[CompactCompany]>(endPoint: CompanyEndpoint.allCompanies).load(completion: completion)
    }
    
    func company(withId id: Int, completion: @escaping (Result<Company, Error>) -> Void) {
        APIGetService<[Company]>(endPoint: CompanyEndpoint.company(id: id)).load { result in
            switch result {
            case .success(let company):
                completion(.success(company[0]))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
