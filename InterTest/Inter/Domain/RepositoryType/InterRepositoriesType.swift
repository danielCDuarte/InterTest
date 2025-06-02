//
//  InterRepositoriesType.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 1/06/25.
//

import Combine
import Foundation

protocol InterRepositoriesType {
    func getVersion()
    func validateOAuth()
    func getSync()
    func getLocalities()
}
