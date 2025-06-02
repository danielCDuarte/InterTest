//
//  PersistenceServiceType.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 1/06/25.
//

import SwiftData
import Foundation

protocol PersistenceServiceType {
    func save<T: PersistentModel>(_ item: T) throws
    func fetch<T: PersistentModel>(_ type: T.Type) throws -> [T]
    func fetchById<T: PersistentModel>(_ type: T.Type, id: PersistentIdentifier) -> T?
    func update<T: PersistentModel>(_ item: T) throws
    func delete<T: PersistentModel>(_ item: T) throws
    func deleteAll<T: PersistentModel>(_ type: T.Type) throws
}
