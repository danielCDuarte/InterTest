//
//  TableModel.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 1/06/25.
//

import Foundation
import SwiftData

@Model
class TableModel: PersistentModel {
    var id: UUID
    var name: String
    init(id: UUID = UUID(), name: String) {
        self.id = id
        self.name = name
    }
}
