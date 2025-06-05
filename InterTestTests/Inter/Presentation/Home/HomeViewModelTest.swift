//
//  HomeViewModelTest.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 4/06/25.
//

import XCTest
import Resolver
@testable import InterTest

class HomeViewModelTest: XCTestCase {
    private var sut: HomeViewModel!
    
    override func setUp() {
        Resolver.registerPresentationMockServices()
        sut = HomeViewModel(
            getVersionUseCase: Resolver.resolve(AnyUseCase<Any?, String>.self),
            postValidateOAuthUseCase: Resolver.resolve(AnyUseCase<UserParamsObject, OauthObject>.self),
            fetchUserModelUseCase: Resolver.resolve(AnyUseCase<Any?, OauthObject>.self),
            saveOauthUseCase: Resolver.resolve(AnyUseCase<OauthObject, Void>.self)
        )
    }
    
    override func tearDown() {
        sut = nil
        GetVersionUseCaseStub.error = nil
        PostValidateOAuthUseCaseStub.error = nil
        FetchUserModelUseCaseStub.error = nil
        SaveOauthUseCaseStub.error = nil
        super.tearDown()
    }
    
    func testOnAppear_WhenReturnSuccess_ThenChangeStateAlertUpdateVersionWasChanged() {
        // Given
        let expectation = XCTestExpectation(description: "get Version")
        GetVersionUseCaseStub.version = TestDomainConstants.versionResponse
        
        // When
        sut.onAppear()
        
        // Then
        let result = XCTWaiter.wait(for: [expectation], timeout: 1.0)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertTrue(sut.state.alertUpdateVersion)
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
    func testOnAppear_WhenThereIsError_ThenChangeStateAlertWasChanged() {
        // Given
        let expectation = XCTestExpectation(description: "get Version")
        GetVersionUseCaseStub.error = NetworkError.serverError
        
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
    
    func testOnAppearValidateOAuth_WhenReturnSuccess_ThenChangeStateOAuthWasChanged() {
        // Given
        let expectation = XCTestExpectation(description: "get Version")
        FetchUserModelUseCaseStub.oAuth = TestDomainConstants.oAuthResponse
        PostValidateOAuthUseCaseStub.oAuth = TestDomainConstants.oAuthResponse
        SaveOauthUseCaseStub.response = Void()
        // When
        sut.onAppear()
        // Then
        let result = XCTWaiter.wait(for: [expectation], timeout: 1.0)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertNotNil(sut.state.oAuth)
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
    func testOnAppearValidateOAuth_WhenThereIsError_ThenChangeStateAlertWasChanged() {
        // Given
        let expectation = XCTestExpectation(description: "get Version")
        GetVersionUseCaseStub.error = NetworkError.serverError
        
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
}
