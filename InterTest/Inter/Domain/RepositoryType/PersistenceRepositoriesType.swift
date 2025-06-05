//
//  PersistenceRepositoriesType.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 4/06/25.
//

import Combine
import Foundation

protocol PersistenceRepositoriesType {
    func saveUserModel(user: UserModel) -> AnyPublisher<Void, Error>
    func fetchUserModel() -> AnyPublisher<OauthObject, Error>
    func saveTableModel(scheme: SchemeModel) -> AnyPublisher<Void, Error>
    func fetchTablesModel() -> AnyPublisher<[SchemeObject], Error>
}
