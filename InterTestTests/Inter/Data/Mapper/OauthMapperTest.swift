//
//  OauthMapperTest.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 3/06/25.
//

@testable import InterTest
import XCTest

class OauthMapperTest: XCTestCase {
    
    override func setUpWithError() throws {
        
    }
    
    override func tearDownWithError() throws {
        
    }
    
    func testOauthMapper_WhenInputIsFilled_ThenReturnObjectFilled() throws {
        // Given
        let input = TestDataConstants.oAuthResponse
        // when
        let result = OauthMapper.map(input: input)
        // then
        XCTAssertEqual(result.id, input.id)
    }
}
