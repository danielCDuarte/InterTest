//
//  TestDataConstants.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 1/06/25.
//

import Foundation
@testable import InterTest

struct TestDataConstants {
    static let apiVersionResponse: APIVersionResponse = {
        .init(numberVersion: 12, name: "Inter app")
    }()
}
