//
//  SchemeMapper.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 3/06/25.
//

struct SchemeMapper: MapperType {
    typealias Input = [APISchemeResponse]
    typealias Output = [SchemeObject]
    
    
    static func map(input: [APISchemeResponse]) -> [SchemeObject] {
        return input.map {
            getScheme(input: $0)
        }
    }
    
    private static func getScheme(input: APISchemeResponse) -> SchemeObject {
        return .init(
            nameTable: input.nameTable,
            primaryKey: input.primaryKey,
            queryCreation: input.queryCreation,
            batchSize: input.batchSize,
            filter: input.filter,
            error: input.error,
            numberOfFields: input.numberOfFields,
            appMethod: input.appMethod,
            updateDate: input.updateDate
        )
    }
}
