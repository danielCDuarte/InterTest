//
//  SchemeModelMapper.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 4/06/25.
//

import Foundation

struct SchemeModelMapper: MapperType {
    typealias Input = [SchemeModel]
    typealias Output = [SchemeObject]
    
    
    static func map(input: [SchemeModel]) -> [SchemeObject] {
        return input.map {
            getScheme(input: $0)
        }
    }
    
    private static func getScheme(input: SchemeModel) -> SchemeObject {
        return .init(
            nameTable: input.nameTable,
            primaryKey: input.primaryKey,
            queryCreation: input.queryCreation,
            batchSize: input.batchSize,
            filter: input.filter,
            numberOfFields: input.numberOfFields,
            updateDate: input.updateDate
        )
    }
}
