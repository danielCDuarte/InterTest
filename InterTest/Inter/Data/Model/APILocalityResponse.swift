//
//  APILocalityResponse.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 3/06/25.
//

import Foundation

struct APILocalityResponse: Codable {
    var id: String
    var name: String
    var cityAbbreviation: String
    
    private enum CodingKeys: String, CodingKey {
        case id = "IdLocalidad",
             name = "NombreCompleto",
             cityAbbreviation = "AbreviacionCiudad"
    }
}

