//
//  Module+Injection.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 3/06/25.
//

import Foundation
import Resolver
import SwiftData

extension Resolver {
    static func RegisterModuleDependencies (with baseUrl: String){
        registerData(with: baseUrl)
        registerDomain()
        registerPresentation()
    }
    
}

extension Resolver {
    static func registerData(with baseUrl: String) {
        register {
            URLSession(configuration: URLSession.configuration())
        }
        register {
            NetworkService(url: baseUrl, urlSession: resolve(URLSession.self))
        }.implements(NetworkServiceType.self)
        
        register {
            InterRepositories(networkService: resolve(NetworkServiceType.self))
        }.implements(InterRepositoriesType.self)
        
    }
    
    static func registerDomain(){
        register {
            GetVersionUseCase(repository: resolve(InterRepositoriesType.self))
        }.implements( AnyUseCase<Any?, String>.self)
        
        register {
            PostValidateOAuthUseCase(repository: resolve(InterRepositoriesType.self))
        }.implements( AnyUseCase<UserObject, OauthObject>.self)
        
        register {
            GetSchemesUseCase(repository: resolve(InterRepositoriesType.self))
        }.implements( AnyUseCase<Any?, [SchemeObject]>.self)
        
        register {
            GetLocalitiesUseCase(repository: resolve(InterRepositoriesType.self))
        }.implements(AnyUseCase<Any?, [LocalityObject]>.self)
        
        let sharedModelContainer: ModelContainer = {
            let schema = Schema([
                TableModel.self,
            ])
            let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

            do {
                return try ModelContainer(for: schema, configurations: [modelConfiguration])
            } catch {
                fatalError("Could not create ModelContainer: \(error)")
            }
        }()
        
        register {
            PersistenceService(container: sharedModelContainer)
        }.implements(PersistenceServiceType.self)
        
    }
    
    static func registerPresentation() {
     
    }
}
