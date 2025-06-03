//
//  LocalitiesMapperTest.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 3/06/25.
//

@testable import InterTest
import XCTest

class LocalitiesMapperTest: XCTestCase {
    
    override func setUpWithError() throws {
        
    }
    
    override func tearDownWithError() throws {
        
    }
    
    func testLocalitiesMapper_WhenInputIsFilled_ThenReturnObjectFilled() throws {
        // Given
        let input = TestDataConstants.localitiesResponse
        // when
        let result = LocalitiesMapper.map(input: input)
        // then
        XCTAssertEqual(result.count, input.count)
    }
}
