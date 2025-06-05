//
//  TablesViewModelTest.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 4/06/25.
//

import XCTest
import Resolver
@testable import InterTest

class TablesViewModelTest: XCTestCase {
    private var sut: TablesViewModel!
    
    override func setUp() {
        Resolver.registerPresentationMockServices()
        sut = TablesViewModel(
            getSchemesUseCase: Resolver.resolve(AnyUseCase<String, [SchemeObject]>.self),
            fetchTablesModelUseCase: Resolver.resolve(AnyUseCase<Any?, [SchemeObject]>.self),
            saveSchemeUseCase: Resolver.resolve(AnyUseCase<SchemeObject, Void>.self)
        )
    }
    
    override func tearDown() {
        GetSchemesUseCaseStub.error = nil
        FetchTablesModelUseCaseStub.error = nil
        SaveSchemeUseCaseStub.error = nil
        sut = nil
        super.tearDown()
    }
    
    
    func testOnAppear_WhenReturnSuccess_ThenChangeSchemesWasChanged() {
        // Given
        let expectation = XCTestExpectation(description: "get Schemes")
        GetSchemesUseCaseStub.schemes = TestDomainConstants.schemesResponse
        FetchTablesModelUseCaseStub.schemes = TestDomainConstants.schemesResponse
        // When
        sut.onAppear()
        
        // Then
        let result = XCTWaiter.wait(for: [expectation], timeout: 1.0)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertTrue(!sut.state.schemes.isEmpty)
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
    func testOnAppear_WhenThereIsError_ThenChangeStateAlertWasChanged() {
        // Given
        let expectation = XCTestExpectation(description: "get Schemes")
        GetSchemesUseCaseStub.error = NetworkError.serverError
        FetchTablesModelUseCaseStub.error = NetworkError.serverError
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
        let expectation = XCTestExpectation(description: "get Schemes")
        FetchTablesModelUseCaseStub.schemes = TestDomainConstants.schemesResponse
        
        // When
        sut.onAppear()
        
        // Then
        _ = XCTWaiter.wait(for: [expectation], timeout: 1.0)
        sut.searchTables(query: "abreviaturas")
        XCTAssertTrue(!sut.state.searchSchemes.isEmpty)
    }
    
    func testOnDisAppear_WhenThereIsChangeState_ThenStateEmptyViewDataWasChanged() {
        // When
        sut.onDisAppear()
        // Then
        XCTAssertFalse(sut.loading)
    }
}
