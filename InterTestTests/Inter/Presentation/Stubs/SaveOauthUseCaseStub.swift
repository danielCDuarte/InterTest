//
//  SaveOauthUseCaseStub.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 4/06/25.
//

import Combine
import Foundation
@testable import InterTest

class SaveOauthUseCaseStub: AnyUseCase<OauthObject, Void> {
    
    static var response: Void = Void()
    
    static var error: Error?
    
    override func execute(params: OauthObject) -> AnyPublisher<Void, Error> {
        let publisher = CurrentValueSubject<Void, Error>(SaveOauthUseCaseStub.response)
        if let error = SaveOauthUseCaseStub.error {
            publisher.send(completion: .failure(error))
        }
        return publisher.eraseToAnyPublisher()
    }
}
