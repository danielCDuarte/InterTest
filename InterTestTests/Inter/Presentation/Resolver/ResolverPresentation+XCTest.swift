//
//  ResolverPresentation+XCTest.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 4/06/25.
//

import Foundation
import Resolver
@testable import InterTest

extension Resolver  {
    
    static func registerPresentationMockServices() {
        root = Resolver.mock
        defaultScope = .application
        
        mock.register {
            FetchTablesModelUseCaseStub()
        }.implements( AnyUseCase<Any?, [SchemeObject]>.self)
        
        mock.register {
            FetchUserModelUseCaseStub()
        }.implements( AnyUseCase<Any?, OauthObject>.self)
        
        mock.register {
            GetLocalitiesUseCaseStub()
        }.implements( AnyUseCase<Any?, [LocalityObject]>.self)
        
        mock.register {
            GetSchemesUseCaseStub()
        }.implements( AnyUseCase<String, [SchemeObject]>.self)
        
        mock.register {
            GetVersionUseCaseStub()
        }.implements( AnyUseCase<Any?, String>.self)
        
        mock.register {
            PostValidateOAuthUseCaseStub()
        }.implements( AnyUseCase<UserParamsObject, OauthObject>.self)
        
        mock.register {
            SaveOauthUseCaseStub()
        }.implements( AnyUseCase<OauthObject, Void>.self)
        
        mock.register {
            SaveSchemeUseCaseStub()
        }.implements( AnyUseCase<SchemeObject, Void>.self)
    }
    
}
