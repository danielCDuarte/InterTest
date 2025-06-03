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
    var error: String?
    var numberOfFields: Int
    var appMethod: String?
    var updateDate: String?
    private enum CodingKeys: String, CodingKey {
        case nameTable = "NombreTabla",
             primaryKey = "Pk",
             queryCreation = "QueryCreacion",
             batchSize = "BatchSize",
             filter = "Filtro",
             error = "Error",
             numberOfFields = "NumeroCampos",
             appMethod = "MetodoApp",
             updateDate = "FechaActualizacionSincro"
    }
}
