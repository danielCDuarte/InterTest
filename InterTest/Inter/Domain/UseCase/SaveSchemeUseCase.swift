//
//  SaveSchemeUseCase.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 4/06/25.
//

import Foundation
import Combine

class SaveSchemeUseCase: AnyUseCase<SchemeObject, Void> {
    let persistenceRepositories: PersistenceRepositoriesType
    
    init(persistenceRepositories: PersistenceRepositoriesType) {
        self.persistenceRepositories = persistenceRepositories
    }
    
    override func execute(params: SchemeObject) -> AnyPublisher<Void, any Error> {
        self.persistenceRepositories.saveTableModel(scheme:
                .init(
                    nameTable: params.nameTable,
                    primaryKey: params.primaryKey,
                    queryCreation: params.queryCreation,
                    batchSize: params.batchSize,
                    filter: params.filter,
                    numberOfFields: params.numberOfFields,
                    updateDate: params.updateDate
                )
        )
    }
}
