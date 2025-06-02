//
//  PersistenceError.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 1/06/25.
//

import Foundation

enum PersistenceError: Error, LocalizedError {
    case contextNotFound
    case itemNotFound
    case saveFailed(Error)
    case fetchFailed(Error)
    case deleteFailed(Error)
}
