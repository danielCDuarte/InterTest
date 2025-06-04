//
//  Factory.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 3/06/25.
//

import Foundation
import Resolver

protocol FactoryProtocol {
    init(baseUrl: String)
}

class Factory: FactoryProtocol {
    
    required init(baseUrl: String) {
        Resolver.RegisterModuleDependencies(with: baseUrl)
    }
}
