//
//  GetSchemesUseCase.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 1/06/25.
//

import Foundation
import Combine

class GetSchemesUseCase: AnyUseCase<String, [SchemeObject]> {
    let repository: InterRepositoriesType
    
    init(repository: InterRepositoriesType) {
        self.repository = repository
    }
    
    override func execute(params: String) -> AnyPublisher<[SchemeObject], any Error> {
        return repository.getSchemes()
            .eraseToAnyPublisher()
    }
}
