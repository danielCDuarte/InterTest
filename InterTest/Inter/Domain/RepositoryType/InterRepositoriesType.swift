//
//  InterRepositoriesType.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 1/06/25.
//

import Combine
import Foundation

protocol InterRepositoriesType {
    func getVersion() -> AnyPublisher<String, Error>
    func postValidateOAuth(_ user: UserObject) -> AnyPublisher<OauthObject, any Error>
    func getSchemes() -> AnyPublisher<[SchemeObject], Error>
    func getLocalities() -> AnyPublisher<[LocalityObject], Error>
}
