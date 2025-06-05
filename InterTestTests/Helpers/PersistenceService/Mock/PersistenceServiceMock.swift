//
//  MockModelContext.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 1/06/25.
//

import XCTest
import SwiftData
@testable import InterTest


final class PersistenceServiceMock {
    static var error: Error?
    static var response: [Any]?
}

extension PersistenceServiceMock: PersistenceServiceType {
    
    func save<T>(_ item: T) throws where T : PersistentModel {
        if let error = PersistenceServiceMock.error {
            throw error
        }
    }
    
    func fetch<T>(_ type: T.Type) throws -> [T] where T : PersistentModel {
        var respObject: [Any] = []
        
        if let response = PersistenceServiceMock.response {
            respObject = response
        }
        if let error = PersistenceServiceMock.error {
            throw error
        }
        return respObject as? [T] ?? []
    }
    
    func fetchById<T>(_ type: T.Type, id: PersistentIdentifier)throws -> T? where T : PersistentModel {
        var respObject: [Any] = []
        
        if let response = PersistenceServiceMock.response {
            respObject = response
        }
        if let error = PersistenceServiceMock.error {
            throw error
        }
        return respObject.first as? T ?? nil
    }
    
    func update<T>(_ item: T) throws where T : PersistentModel {
        if let error = PersistenceServiceMock.error {
            throw error
        }
    }
    
    func delete<T>(_ item: T) throws where T : PersistentModel {
        if let error = PersistenceServiceMock.error {
            throw error
        }
    }
    
    func deleteAll<T>(_ type: T.Type) throws where T : PersistentModel {
        if let error = PersistenceServiceMock.error {
            throw error
        }
    }
}
