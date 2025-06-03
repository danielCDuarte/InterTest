//
//  PostValidateOAuthUseCase.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 1/06/25.
//

import Foundation
import Combine

class PostValidateOAuthUseCase: AnyUseCase< UserObject, OauthObject> {
    let repository: InterRepositoriesType
    
    init(repository: InterRepositoriesType) {
        self.repository = repository
    }
    
    override func execute(params: UserObject) -> AnyPublisher<OauthObject, any Error> {
        return repository.postValidateOAuth(params)
            .eraseToAnyPublisher()
    }
}
