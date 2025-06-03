//
//  GetSchemesUseCase.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 1/06/25.
//

import Foundation
import Combine

class GetSchemesUseCase: AnyUseCase< Any?, [SchemeObject]> {
    let repository: InterRepositoriesType
    
    init(repository: InterRepositoriesType) {
        self.repository = repository
    }
    
    override func execute(params: Any?) -> AnyPublisher<[SchemeObject], any Error> {
        return repository.getSchemes()
            .eraseToAnyPublisher()
    }
}
