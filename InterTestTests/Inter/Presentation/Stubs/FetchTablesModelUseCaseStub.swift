//
//  FetchTablesModelUseCaseStub.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 4/06/25.
//

import Combine
import Foundation
@testable import InterTest

class FetchTablesModelUseCaseStub: AnyUseCase<Any?, [SchemeObject]> {
    
    static var schemes: [SchemeObject] = TestDomainConstants.schemesResponse
    
    static var error: Error?
    
    override func execute(params: Any?) -> AnyPublisher<[SchemeObject], Error> {
        let publisher = CurrentValueSubject<[SchemeObject], Error>(FetchTablesModelUseCaseStub.schemes)
        if let error = FetchTablesModelUseCaseStub.error {
            publisher.send(completion: .failure(error))
        }
        return publisher.eraseToAnyPublisher()
    }
}
