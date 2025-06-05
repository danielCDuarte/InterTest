//
//  LocalitiesViewModelTest.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 4/06/25.
//

import XCTest
import Resolver
@testable import InterTest

class LocalitiesViewModelTest: XCTestCase {
    private var sut: LocalitiesViewModel!
    
    override func setUp() {
        Resolver.registerPresentationMockServices()
        sut = LocalitiesViewModel(getLocalitiesUseCase: Resolver.resolve(AnyUseCase<Any?, [LocalityObject]>.self))
    }
    
    override func tearDown() {
        GetLocalitiesUseCaseStub.error = nil
        sut = nil
        super.tearDown()
    }
    
    func testOnAppear_WhenReturnSuccess_ThenChangeStateLocalitiesWasChanged() {
        // Given
        let expectation = XCTestExpectation(description: "get Localities")
        GetLocalitiesUseCaseStub.localities = TestDomainConstants.localitiesResponse
        
        // When
        sut.onAppear()
        
        // Then
        let result = XCTWaiter.wait(for: [expectation], timeout: 1.0)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertFalse(sut.state.localities.isEmpty)
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
    func testOnAppear_WhenThereIsError_TThenChangeStateLocalitiesWasChanged() {
        // Given
        let expectation = XCTestExpectation(description: "get Localities")
        GetLocalitiesUseCaseStub.error = NetworkError.serverError
        
        // When
        sut.onAppear()
        
        // Then
        let result = XCTWaiter.wait(for: [expectation], timeout: 1.0)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertTrue(sut.state.alert)
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
    func testSearchLocalities_WhenReturnSuccess_ThenChangeStateSearchLocalitiesWasChanged() {
        // Given
        let expectation = XCTestExpectation(description: "get Localities")
        GetLocalitiesUseCaseStub.localities = TestDomainConstants.localitiesResponse
        
        // When
        sut.onAppear()
        
        // Then
        _ = XCTWaiter.wait(for: [expectation], timeout: 1.0)
        sut.searchLocalities(query: "mede")
        XCTAssertTrue(!sut.state.searchLocalities.isEmpty)
    }
    
    func testOnDisAppear_WhenThereIsChangeState_ThenStateEmptyViewDataWasChanged() {
        // When
        sut.onDisAppear()
        // Then
        XCTAssertFalse(sut.loading)
    }
}
