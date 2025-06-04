//
//  InterRepositoriesStub.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 3/06/25.
//

import Combine
@testable import InterTest

final class InterRepositoriesStub {
    static var error: Error?
    static var responseVersion: String!
    static var responsePostValidateOAuth: OauthObject!
    static var responseGetSchemes: [SchemeObject]!
    static var responseGetLocalities: [LocalityObject]!
}

extension InterRepositoriesStub: InterRepositoriesType {
    func getVersion() -> AnyPublisher<String, any Error> {
        let data = InterRepositoriesStub.responseVersion ?? ""
        let publisher = CurrentValueSubject<String, Error>(data)
        
        if let error = InterRepositoriesStub.error {
            publisher.send(completion: .failure(error))
        }
        return publisher.eraseToAnyPublisher()
    }
    
    func postValidateOAuth(_ userParams: UserParamsObject) -> AnyPublisher<OauthObject, any Error> {
        let data = InterRepositoriesStub.responsePostValidateOAuth ?? OauthObject(id: "", name: "", user: "")
        let publisher = CurrentValueSubject<OauthObject, Error>(data)
        
        if let error = InterRepositoriesStub.error {
            publisher.send(completion: .failure(error))
        }
        return publisher.eraseToAnyPublisher()
    }
    
    func getSchemes() -> AnyPublisher<[SchemeObject], any Error> {
        let data = InterRepositoriesStub.responseGetSchemes ?? []
        let publisher = CurrentValueSubject<[SchemeObject], Error>(data)
        
        if let error = InterRepositoriesStub.error {
            publisher.send(completion: .failure(error))
        }
        return publisher.eraseToAnyPublisher()
    }
    
    func getLocalities() -> AnyPublisher<[LocalityObject], any Error> {
        let data = InterRepositoriesStub.responseGetLocalities ?? []
        let publisher = CurrentValueSubject<[LocalityObject], Error>(data)
        
        if let error = InterRepositoriesStub.error {
            publisher.send(completion: .failure(error))
        }
        return publisher.eraseToAnyPublisher()
    }
   
}
