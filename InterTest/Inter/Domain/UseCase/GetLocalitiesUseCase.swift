//
//  GetLocalitiesUseCase.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 1/06/25.
//

import Foundation
import Combine

class GetLocalitiesUseCase: AnyUseCase< Any?, [LocalityObject]> {
    let repository: InterRepositoriesType
    
    init(repository: InterRepositoriesType) {
        self.repository = repository
    }
    
    override func execute(params: Any?) -> AnyPublisher<[LocalityObject], any Error> {
        return repository.getLocalities()
            .eraseToAnyPublisher()
    }
}
