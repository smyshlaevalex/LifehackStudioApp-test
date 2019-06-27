//
//  APIGetService.swift
//  LifehackStudioApp
//
//  Created by Alexander Smyshlaev on 27/06/2019.
//  Copyright © 2019 Alexander Smyshlaev. All rights reserved.
//

import Foundation

class APIGetService<T: Decodable> {
    let session: URLSession
    let decoder: JSONDecoder
    let endPoint: APIEndpoint
    
    init(session: URLSession = URLSession.shared,
         decoder: JSONDecoder = JSONDecoder(),
         endPoint: APIEndpoint) {
        self.session = session
        self.decoder = decoder
        self.endPoint = endPoint
    }
    
    func load(completion: @escaping (Result<T, Error>) -> Void) {
        session.dataTask(with: endPoint.url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            if let data = data {
                do {
                    let decodedObject = try self.decoder.decode(T.self, from: data)
                    completion(.success(decodedObject))
                } catch {
                    completion(.failure(error))
                }
            }
        } .resume()
    }
}
