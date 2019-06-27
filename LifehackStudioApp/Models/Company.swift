//
//  Company.swift
//  LifehackStudioApp
//
//  Created by Alexander Smyshlaev on 27/06/2019.
//  Copyright © 2019 Alexander Smyshlaev. All rights reserved.
//

import Foundation

struct Company {
    let id: Int
    let name: String
    let description: String
}

extension Company: Decodable {
    private enum CodingKeys: CodingKey {
        case id, name, description
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let idString = try container.decode(String.self, forKey: .id)
        guard let id = Int(idString) else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: [CodingKeys.id],
                                                                    debugDescription: "id is not Int"))
        }
        
        self.id = id
        name = try container.decode(String.self, forKey: .name)
        description = try container.decode(String.self, forKey: .description)
    }
}
