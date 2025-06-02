//
//  UseCase.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 1/06/25.
//

import Combine
import Foundation

protocol Interactorable {
    associatedtype Response
    associatedtype Params
    
    func execute(params: Params) -> AnyPublisher<Response, Error>
}

open class AnyUseCase<Input, Output>: Interactorable {
    typealias Response = Output
    typealias Params = Input
    
    func execute(params: Input) -> AnyPublisher<Output, Error> {
        fatalError("This method must be implemented")
    }
}
