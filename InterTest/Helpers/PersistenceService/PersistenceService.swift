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
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }
    
    convenience init(modelContainer: ModelContainer) {
        let context = ModelContext(modelContainer)
        self.init(modelContext: context)
    }
    
    func save<T: PersistentModel>(_ item: T) throws {
        do {
            modelContext.insert(item)
            try modelContext.save()
        } catch {
            throw PersistenceError.saveFailed(error)
        }
    }
    
    func fetch<T: PersistentModel>(_ type: T.Type) throws -> [T] {
        do {
            let descriptor = FetchDescriptor<T>()
            return try modelContext.fetch(descriptor)
        } catch {
            throw PersistenceError.fetchFailed(error)
        }
    }
    
    func fetchById<T: PersistentModel>(_ type: T.Type, id: PersistentIdentifier) -> T? {
        return modelContext.model(for: id) as? T
    }
    
    func fetch<T: PersistentModel>(_ type: T.Type, predicate: Predicate<T>?) throws -> [T] {
        do {
            var descriptor = FetchDescriptor<T>()
            if let predicate = predicate {
                descriptor.predicate = predicate
            }
            return try modelContext.fetch(descriptor)
        } catch {
            throw PersistenceError.fetchFailed(error)
        }
    }
    
    func fetch<T: PersistentModel>(_ type: T.Type, sortBy: [SortDescriptor<T>]) throws -> [T] {
        do {
            var descriptor = FetchDescriptor<T>()
            descriptor.sortBy = sortBy
            return try modelContext.fetch(descriptor)
        } catch {
            throw PersistenceError.fetchFailed(error)
        }
    }
    
    func fetch<T: PersistentModel>(_ type: T.Type, limit: Int) throws -> [T] {
        do {
            var descriptor = FetchDescriptor<T>()
            descriptor.fetchLimit = limit
            return try modelContext.fetch(descriptor)
        } catch {
            throw PersistenceError.fetchFailed(error)
        }
    }
    
    func update<T: PersistentModel>(_ item: T) throws {
        do {
            try modelContext.save()
        } catch {
            throw PersistenceError.saveFailed(error)
        }
    }
    
    func delete<T: PersistentModel>(_ item: T) throws {
        do {
            modelContext.delete(item)
            try modelContext.save()
        } catch {
            throw PersistenceError.deleteFailed(error)
        }
    }
    
    func deleteById<T: PersistentModel>(_ type: T.Type, id: PersistentIdentifier) throws {
        guard let item = fetchById(type, id: id) else {
            throw PersistenceError.itemNotFound
        }
        try delete(item)
    }
    
    func deleteAll<T: PersistentModel>(_ type: T.Type) throws {
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
    
    func count<T: PersistentModel>(_ type: T.Type) throws -> Int {
        do {
            let descriptor = FetchDescriptor<T>()
            return try modelContext.fetchCount(descriptor)
        } catch {
            throw PersistenceError.fetchFailed(error)
        }
    }
    
    func exists<T: PersistentModel>(_ type: T.Type, predicate: Predicate<T>) throws -> Bool {
        do {
            var descriptor = FetchDescriptor<T>()
            descriptor.predicate = predicate
            descriptor.fetchLimit = 1
            let items = try modelContext.fetch(descriptor)
            return !items.isEmpty
        } catch {
            throw PersistenceError.fetchFailed(error)
        }
    }
    
    func saveAll<T: PersistentModel>(_ items: [T]) throws {
        do {
            for item in items {
                modelContext.insert(item)
            }
            try modelContext.save()
        } catch {
            throw PersistenceError.saveFailed(error)
        }
    }
    
    func deleteAll<T: PersistentModel>(_ items: [T]) throws {
        do {
            for item in items {
                modelContext.delete(item)
            }
            try modelContext.save()
        } catch {
            throw PersistenceError.deleteFailed(error)
        }
    }
}
