//
//  FetchUserModelUseCase.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 4/06/25.
//

import Foundation
import Combine

class FetchUserModelUseCase: AnyUseCase<Any?, OauthObject> {
    let persistenceRepositories: PersistenceRepositoriesType
    
    init(persistenceRepositories: PersistenceRepositoriesType) {
        self.persistenceRepositories = persistenceRepositories
    }
    override func execute(params: Any?) -> AnyPublisher<OauthObject, any Error> {
        self.persistenceRepositories.fetchUserModel()
    }
}
