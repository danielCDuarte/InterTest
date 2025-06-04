//
//  SchemeObject.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 3/06/25.
//

import Foundation

struct SchemeObject: Identifiable {
    let id = UUID()
    var nameTable: String?
    var primaryKey: String?
    var queryCreation: String?
    var batchSize: Int
    var filter: String?
    var numberOfFields: Int
    var updateDate: String?
}
