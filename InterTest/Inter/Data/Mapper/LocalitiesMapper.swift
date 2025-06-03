//
//  LocalitiesMapper.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 3/06/25.
//

import Foundation

struct LocalitiesMapper: MapperType {
    typealias Input = [APILocalityResponse]
    typealias Output = [LocalityObject]
    
    static func map(input: [APILocalityResponse]) -> [LocalityObject] {
        return input.map {
            getLocality(input: $0)
        }
    }
    
    private static func getLocality(input: APILocalityResponse) -> LocalityObject {
        return .init(
            id: input.id,
            name: input.name,
            cityAbbreviation: input.cityAbbreviation
        )
    }
    
}
