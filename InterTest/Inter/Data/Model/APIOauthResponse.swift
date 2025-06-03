//
//  APIOauthResponse.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 1/06/25.
//

import Foundation

struct APIOauthResponse: Codable {
    var id: String
    var name: String
    var user: String
    
    private enum CodingKeys: String, CodingKey {
        case id = "Identificacion",
             name = "Nombre",
             user = "Usuario"
    }
}
