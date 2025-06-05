//
//  UserModelMapper.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 4/06/25.
//

import Foundation

struct UserModelMapper: MapperType {
    typealias Input = UserModel
    typealias Output = OauthObject
    
    static func map(input: UserModel) -> OauthObject {
        return .init(
            id: input.idUser,
            name: input.name,
            user: input.user
        )
    }
}
