//
//  ResolverDomain+XCTest.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 3/06/25.
//

import Foundation
import Resolver
@testable import InterTest

extension Resolver  {
    static var mock = Resolver(child: .main)
    
    static func registerDomainMockServices() {
        root = Resolver.mock
        defaultScope = .application
        mock.register { InterRepositoriesStub() }
            .implements(InterRepositoriesType.self)
        
    }
    
}
