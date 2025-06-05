//
//  PostValidateOAuthUseCaseStub.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 4/06/25.
//

import Combine
import Foundation
@testable import InterTest

class PostValidateOAuthUseCaseStub: AnyUseCase<UserParamsObject, OauthObject> {
    
    static var oAuth: OauthObject = TestDomainConstants.oAuthResponse
    
    static var error: Error?
    
    override func execute(params: UserParamsObject) -> AnyPublisher<OauthObject, Error> {
        let publisher = CurrentValueSubject<OauthObject, Error>(PostValidateOAuthUseCaseStub.oAuth)
        if let error = PostValidateOAuthUseCaseStub.error {
            publisher.send(completion: .failure(error))
        }
        return publisher.eraseToAnyPublisher()
    }
}
