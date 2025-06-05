//
//  PersistenceError.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 1/06/25.
//

import Foundation

enum PersistenceError: Error, LocalizedError, Equatable {
    case contextNotFound
    case itemNotFound
    case saveFailed(Error)
    case fetchFailed(Error)
    case deleteFailed(Error)
    
    static func == (lhs: PersistenceError, rhs: PersistenceError) -> Bool {
        switch (lhs, rhs) {
        case (.contextNotFound, .contextNotFound): return true
        case (.itemNotFound, .itemNotFound): return true
        case (.saveFailed, .saveFailed): return true
        case (.fetchFailed, .fetchFailed): return true
        case (.deleteFailed, .deleteFailed): return true
        default: return false
        }
    }
}
