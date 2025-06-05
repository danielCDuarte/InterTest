//
//  PersistenceService.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 1/06/25.
//

import SwiftData
import Foundation

class PersistenceService: PersistenceServiceType {
    
    private let modelContext: ModelContext
    
    init(container: ModelContainer) {
        modelContext = ModelContext(container)
    }
    
    func save<T>(_ item: T) throws where T : PersistentModel {
        do {
            modelContext.insert(item)
            try modelContext.save()
        } catch {
            throw PersistenceError.saveFailed(error)
        }
    }
    
    func fetch<T>(_ type: T.Type) throws -> [T] where T : PersistentModel {
        do {
            let descriptor = FetchDescriptor<T>()
            return try modelContext.fetch(descriptor)
        } catch {
            throw PersistenceError.fetchFailed(error)
        }
    }
    
    func fetchById<T>(_ type: T.Type, id: PersistentIdentifier) throws -> T? where T : PersistentModel {
        return modelContext.model(for: id) as? T
    }
    
    func update<T>(_ item: T) throws where T : PersistentModel {
        do {
            try modelContext.save()
        } catch {
            throw PersistenceError.saveFailed(error)
        }
    }
    
    func delete<T>(_ item: T) throws where T : PersistentModel {
        do {
            modelContext.delete(item)
            try modelContext.save()
        } catch {
            throw PersistenceError.deleteFailed(error)
        }
    }
    
    func deleteAll<T>(_ type: T.Type) throws where T : PersistentModel {
        do {
            let items = try fetch(type)
            for item in items {
                modelContext.delete(item)
            }
            try modelContext.save()
        } catch {
            throw PersistenceError.deleteFailed(error)
        }
    }
    
    func doesNotExist<T>(_ type: T.Type, matching predicate: Predicate<T>) throws -> Bool where T : PersistentModel {
        let descriptor = FetchDescriptor<T>(predicate: predicate)
        do {
            let results = try modelContext.fetch(descriptor)
            return results.isEmpty
        } catch {
            throw PersistenceError.fetchFailed(error)
        }
    }
}
