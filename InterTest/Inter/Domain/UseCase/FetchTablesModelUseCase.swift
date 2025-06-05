//
//  FetchTablesModelUseCase.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 4/06/25.
//

import Foundation
import Combine

class FetchTablesModelUseCase: AnyUseCase<Any?, [SchemeObject]> {
    let persistenceRepositories: PersistenceRepositoriesType
    
    init(persistenceRepositories: PersistenceRepositoriesType) {
        self.persistenceRepositories = persistenceRepositories
    }
    override func execute(params: Any?) -> AnyPublisher<[SchemeObject], any Error> {
        self.persistenceRepositories.fetchTablesModel()
    }
}
