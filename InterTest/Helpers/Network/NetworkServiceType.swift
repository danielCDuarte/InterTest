//
//  NetworkServiceType.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 1/06/25.
//

import Combine
import Foundation

protocol NetworkServiceType {
    func setBaseUrl(_ baseUrl: String)
        
    func request<Response>(
        _ endpoint: NetworkRequest<Response>,
        queue: DispatchQueue) -> AnyPublisher<Response, Error> where Response: Decodable
}
