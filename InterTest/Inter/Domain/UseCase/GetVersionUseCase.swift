//
//  GetVersionUseCase.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 1/06/25.
//

import Foundation
import Combine

class GetVersionUseCase: AnyUseCase<Any?, String> {
    let repository: InterRepositoriesType
    
    init(repository: InterRepositoriesType) {
        self.repository = repository
    }
    
    override func execute(params: Any?) -> AnyPublisher<String, any Error> {
        return repository.getVersion()
            .eraseToAnyPublisher()
    }
}
