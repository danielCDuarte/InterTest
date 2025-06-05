//
//  SaveSchemeUseCaseStub.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 4/06/25.
//

import Combine
import Foundation
@testable import InterTest

class SaveSchemeUseCaseStub: AnyUseCase<SchemeObject, Void> {
    
    static var response: Void = Void()
    
    static var error: Error?
    
    override func execute(params: SchemeObject) -> AnyPublisher<Void, Error> {
        let publisher = CurrentValueSubject<Void, Error>(SaveSchemeUseCaseStub.response)
        if let error = SaveSchemeUseCaseStub.error {
            publisher.send(completion: .failure(error))
        }
        return publisher.eraseToAnyPublisher()
    }
}
