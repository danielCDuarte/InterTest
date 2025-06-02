//
//  APIVersionResponse.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 1/06/25.
//

import Foundation

struct APIVersionResponse: Codable {
    var numberVersion: Int
    var name: String
    
    private enum CodingKeys: String, CodingKey {
        case numberVersion,name
    }
}
