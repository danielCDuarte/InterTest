//
//  GetVersionUseCaseStub.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 4/06/25.
//

import Combine
import Foundation
@testable import InterTest

class GetVersionUseCaseStub: AnyUseCase<Any?, String> {
    
    static var version: String = TestDomainConstants.versionResponse
    
    static var error: Error?
    
    override func execute(params: Any?) -> AnyPublisher<String, Error> {
        let publisher = CurrentValueSubject<String, Error>(GetVersionUseCaseStub.version)
        if let error = GetVersionUseCaseStub.error {
            publisher.send(completion: .failure(error))
        }
        return publisher.eraseToAnyPublisher()
    }
}
