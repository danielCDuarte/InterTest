//
//  GetLocalitiesUseCaseStub.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 4/06/25.
//

import Combine
import Foundation
@testable import InterTest

class GetLocalitiesUseCaseStub: AnyUseCase<Any?, [LocalityObject]> {
    
    static var localities: [LocalityObject] = TestDomainConstants.localitiesResponse
    
    static var error: Error?
    
    override func execute(params: Any?) -> AnyPublisher<[LocalityObject], Error> {
        let publisher = CurrentValueSubject<[LocalityObject], Error>(GetLocalitiesUseCaseStub.localities)
        if let error = GetLocalitiesUseCaseStub.error {
            publisher.send(completion: .failure(error))
        }
        return publisher.eraseToAnyPublisher()
    }
}
