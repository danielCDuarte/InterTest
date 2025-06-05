//
//  PersistenceRepositoriesStub.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 4/06/25.
//

import Combine
@testable import InterTest

final class PersistenceRepositoriesStub {
    static var error: Error?
    static var responseSave: Void!
    static var responseFetchUserModel: OauthObject!
    static var responseFetchTablesModel: [SchemeObject]!
}

extension PersistenceRepositoriesStub: PersistenceRepositoriesType {
    func saveUserModel(user: UserModel) -> AnyPublisher<Void, any Error> {
        let data: Void = PersistenceRepositoriesStub.responseSave ?? Void()
        let publisher = CurrentValueSubject<Void, Error>(data)
        
        if let error = PersistenceRepositoriesStub.error {
            publisher.send(completion: .failure(error))
        }
        return publisher.eraseToAnyPublisher()
    }
    
    func fetchUserModel() -> AnyPublisher<OauthObject, any Error> {
        let data: OauthObject = PersistenceRepositoriesStub.responseFetchUserModel ??
        OauthObject(id: "", name: "", user: "")
        let publisher = CurrentValueSubject<OauthObject, Error>(data)
        
        if let error = PersistenceRepositoriesStub.error {
            publisher.send(completion: .failure(error))
        }
        return publisher.eraseToAnyPublisher()
    }
    
    func saveTableModel(scheme: SchemeModel) -> AnyPublisher<Void, any Error> {
        let data: Void = PersistenceRepositoriesStub.responseSave ?? Void()
        let publisher = CurrentValueSubject<Void, Error>(data)
        
        if let error = PersistenceRepositoriesStub.error {
            publisher.send(completion: .failure(error))
        }
        return publisher.eraseToAnyPublisher()
    }
    
    func fetchTablesModel() -> AnyPublisher<[SchemeObject], any Error> {
        let data: [SchemeObject] = PersistenceRepositoriesStub.responseFetchTablesModel ?? []
        let publisher = CurrentValueSubject<[SchemeObject], Error>(data)
        
        if let error = PersistenceRepositoriesStub.error {
            publisher.send(completion: .failure(error))
        }
        return publisher.eraseToAnyPublisher()
    }
}
