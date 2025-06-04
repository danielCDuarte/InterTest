//
//  SchemeModel.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 1/06/25.
//

import Foundation
import SwiftData

@Model
class SchemeModel {
    var id: UUID
    var nameTable: String?
    var primaryKey: String?
    var queryCreation: String?
    var batchSize: Int
    var filter: String?
    var error: String?
    var numberOfFields: Int
    var appMethod: String?
    var updateDate: String?
    
    init(
        id: UUID = UUID(),
        nameTable: String? = nil,
        primaryKey: String? = nil,
        queryCreation: String? = nil,
        batchSize: Int,
        filter: String? = nil,
        error: String? = nil,
        numberOfFields: Int,
        appMethod: String? = nil,
        updateDate: String? = nil) {
        self.id = id
        self.nameTable = nameTable
        self.primaryKey = primaryKey
        self.queryCreation = queryCreation
        self.batchSize = batchSize
        self.filter = filter
        self.error = error
        self.numberOfFields = numberOfFields
        self.appMethod = appMethod
        self.updateDate = updateDate
    }
}
