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
        let sharedModelContainer: ModelContainer = {
            let schema = Schema([
                SchemeModel.self,
                UserModel.self
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
        
        register {
            PersistenceRepositories(persistenceService: resolve(PersistenceServiceType.self))
        }.implements(PersistenceRepositoriesType.self)
        
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
        }.implements( AnyUseCase<UserParamsObject, OauthObject>.self)
        
        register {
            GetSchemesUseCase(repository: resolve(InterRepositoriesType.self))
        }.implements( AnyUseCase<String, [SchemeObject]>.self)
        
        register {
            GetLocalitiesUseCase(repository: resolve(InterRepositoriesType.self))
        }.implements(AnyUseCase<Any?, [LocalityObject]>.self)
        
        register {
            SaveOauthUseCase(persistenceRepositories: resolve(PersistenceRepositoriesType.self))
        }.implements(AnyUseCase<OauthObject, Void>.self)
        
        register {
            FetchUserModelUseCase(persistenceRepositories: resolve(PersistenceRepositoriesType.self))
        }.implements(AnyUseCase<Any?, OauthObject>.self)
        
        register {
            SaveSchemeUseCase(persistenceRepositories: resolve(PersistenceRepositoriesType.self))
        }.implements(AnyUseCase<SchemeObject, Void>.self)
        
        register {
            FetchTablesModelUseCase(persistenceRepositories: resolve(PersistenceRepositoriesType.self))
        }.implements(AnyUseCase<Any?, [SchemeObject]>.self)
        
    }
    
    static func registerPresentation() {
        register(HomeViewModel.self){ _ in
            return HomeViewModel(
                getVersionUseCase: resolve(AnyUseCase<Any?, String>.self),
                postValidateOAuthUseCase: resolve(AnyUseCase<UserParamsObject, OauthObject>.self),
                fetchUserModelUseCase: resolve(AnyUseCase<Any?, OauthObject>.self),
                saveOauthUseCase: resolve(AnyUseCase<OauthObject, Void>.self)
            )
        }
        
        register(LocalitiesViewModel.self){ _ in
            return LocalitiesViewModel(
                getLocalitiesUseCase: resolve(AnyUseCase<Any?, [LocalityObject]>.self)
            )
        }
        
        register(TablesViewModel.self){ _ in
            return TablesViewModel(
                getSchemesUseCase: resolve(AnyUseCase<String, [SchemeObject]>.self),
                fetchTablesModelUseCase: resolve(AnyUseCase<Any?, [SchemeObject]>.self),
                saveSchemeUseCase: resolve(AnyUseCase<SchemeObject, Void>.self)
            )
        }
    }
}
