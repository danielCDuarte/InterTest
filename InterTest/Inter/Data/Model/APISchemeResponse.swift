//
//  APISchemeResponse.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 3/06/25.
//

import Foundation

struct APISchemeResponse: Codable {
    var nameTable: String?
    var primaryKey: String?
    var queryCreation: String?
    var batchSize: Int
    var filter: String?
    var numberOfFields: Int
    var updateDate: String
    
    private enum CodingKeys: String, CodingKey {
        case nameTable = "NombreTabla",
             primaryKey = "Pk",
             queryCreation = "QueryCreacion",
             batchSize = "BatchSize",
             filter = "Filtro",
             numberOfFields = "NumeroCampos",
             updateDate = "FechaActualizacionSincro"
    }
}
