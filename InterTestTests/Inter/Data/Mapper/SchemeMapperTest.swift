//
//  SchemeMapperTest.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 3/06/25.
//

@testable import InterTest
import XCTest

class SchemeMapperTest: XCTestCase {
    
    override func setUpWithError() throws {
        
    }
    
    override func tearDownWithError() throws {
        
    }
    
    func testSchemeMapper_WhenInputIsFilled_ThenReturnObjectFilled() throws {
        // Given
        let input = TestDataConstants.schemesResponse
        // when
        let result = SchemeMapper.map(input: input)
        // then
        XCTAssertEqual(result.count, input.count)
    }
}
