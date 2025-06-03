//
//  OauthMapper.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 3/06/25.
//

import Foundation

struct OauthMapper: MapperType {
    typealias Input = APIOauthResponse
    typealias Output = OauthObject
    
    static func map(input: APIOauthResponse) -> OauthObject {
        return .init(
            id: input.id,
            name: input.name,
            user: input.user
        )
    }
}
