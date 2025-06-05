//
//  FetchUserModelUseCaseStub.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 4/06/25.
//

import Combine
import Foundation
@testable import InterTest

class FetchUserModelUseCaseStub: AnyUseCase<Any?, OauthObject> {
    
    static var oAuth: OauthObject = TestDomainConstants.oAuthResponse
    
    static var error: Error?
    
    override func execute(params: Any?) -> AnyPublisher<OauthObject, Error> {
        let publisher = CurrentValueSubject<OauthObject, Error>(FetchUserModelUseCaseStub.oAuth)
        if let error = FetchUserModelUseCaseStub.error {
            publisher.send(completion: .failure(error))
        }
        return publisher.eraseToAnyPublisher()
    }
}
