//
//  InterRepositories.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 1/06/25.
//

import Combine
import Foundation

class InterRepositories: InterRepositoriesType {
    
    private(set) var networkService: NetworkServiceType
    
    init(networkService: NetworkServiceType) {
        self.networkService = networkService
    }
    
    func getVersion() {
        
    }
    
    func validateOAuth() {
        
    }
    
    func getSync() {
        
    }
    
    func getLocalities() {
        
    }
}
