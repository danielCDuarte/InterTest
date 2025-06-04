//
//  UserModel.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 3/06/25.
//

import Foundation
import SwiftData

@Model
class UserModel {
    var id: UUID
    var idUser: String
    var name: String
    var user: String
    
    init(
        id: UUID = UUID(),
        idUser: String,
        name: String,
        user: String) {
        self.id = id
        self.idUser = idUser
        self.name = name
        self.user = user
    }
}
