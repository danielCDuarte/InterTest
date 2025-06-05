//
//  PersistenceRepositories.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 4/06/25.
//

import Combine
import Foundation

class PersistenceRepositories: PersistenceRepositoriesType {
    
    private(set) var persistenceService: PersistenceServiceType
    
    init(persistenceService: PersistenceServiceType) {
        self.persistenceService = persistenceService
    }
    
    func saveUserModel(user: UserModel) -> AnyPublisher<Void, any Error> {
        Future<Void, Error> { promise in
            do {
                try self.persistenceService.save(user)
                promise(.success(()))
            } catch {
                promise(.failure(error))
            }
        }
        .eraseToAnyPublisher()
    }
    
    func fetchUserModel() -> AnyPublisher<OauthObject, any Error> {
        Future<OauthObject, Error> { promise in
            do {
                let users = try self.persistenceService.fetch(UserModel.self)
                guard let firstOauth = users.first else {
                    return promise(.failure(PersistenceError.itemNotFound))
                }
                promise(.success(UserModelMapper.map(input: firstOauth)))
            } catch {
                promise(.failure(error))
            }
        }
        .eraseToAnyPublisher()
    }
    
    func saveTableModel(scheme: SchemeModel) -> AnyPublisher<Void, any Error> {
        Future<Void, Error> { promise in
            do {
                try self.persistenceService.save(scheme)
                promise(.success(()))
            } catch {
                promise(.failure(error))
            }
        }
        .eraseToAnyPublisher()
    }
    
    func fetchTablesModel() -> AnyPublisher<[SchemeObject], any Error> {
        Future<[SchemeObject], Error> { promise in
            do {
                let schemes = try self.persistenceService.fetch(SchemeModel.self)
                if schemes.isEmpty {
                    return promise(.failure(PersistenceError.itemNotFound))
                }
                promise(.success(SchemeModelMapper.map(input: schemes)))
            } catch {
                promise(.failure(error))
            }
        }
        .eraseToAnyPublisher()
    }
}
