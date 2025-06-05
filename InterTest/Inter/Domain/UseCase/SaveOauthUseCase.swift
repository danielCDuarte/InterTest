//
//  SaveOauthUseCase.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 4/06/25.
//

import Foundation
import Combine

class SaveOauthUseCase: AnyUseCase<OauthObject, Void> {
    let persistenceRepositories: PersistenceRepositoriesType
    
    init(persistenceRepositories: PersistenceRepositoriesType) {
        self.persistenceRepositories = persistenceRepositories
    }
    
    override func execute(params: OauthObject) -> AnyPublisher<Void, any Error> {
        self.persistenceRepositories.saveUserModel(
            user: .init(
                idUser: params.id,
                name: params.name,
                user: params.user
            )
        )
    }
}
