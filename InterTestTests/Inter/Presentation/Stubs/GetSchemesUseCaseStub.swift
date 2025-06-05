//
//  GetSchemesUseCaseStub.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 4/06/25.
//

import Combine
import Foundation
@testable import InterTest

class GetSchemesUseCaseStub: AnyUseCase<String, [SchemeObject]> {
    
    static var schemes: [SchemeObject] = TestDomainConstants.schemesResponse
    
    static var error: Error?
    
    override func execute(params: String) -> AnyPublisher<[SchemeObject], Error> {
        let publisher = CurrentValueSubject<[SchemeObject], Error>(GetSchemesUseCaseStub.schemes)
        if let error = GetSchemesUseCaseStub.error {
            publisher.send(completion: .failure(error))
        }
        return publisher.eraseToAnyPublisher()
    }
}
