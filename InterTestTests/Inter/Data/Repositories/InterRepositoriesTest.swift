//
//  InterRepositoriesTest.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 3/06/25.
//

import Foundation
import XCTest
import Combine

@testable import InterTest

final class InterRepositoriesTest: XCTestCase {
    private var cancellable: AnyCancellable?
    private var networkService: NetworkServiceType!
    private var sut: InterRepositoriesType!
    
    override func setUp() {
        super.setUp()
        networkService = NetworkServiceMock()
        sut = InterRepositories(networkService: networkService)
    }
    
    override func tearDown() {
        NetworkServiceMock.response = nil
        NetworkServiceMock.error = nil
        sut = nil
        cancellable = nil
        super.tearDown()
    }
    
    func testInterRepositories_whenGetVersion_ResponseSuccess() {
        //Given
        let expectationFailure = expectation(description: "failure")
        let successExpectation = expectation(description: "Consume Web Service Response Expectation")
        expectationFailure.isInverted = true
        
        NetworkServiceMock.response = TestDataConstants.versionResponse as AnyObject
        
        //When
        self.cancellable = sut.getVersion()
            .sink { completion in
                guard case .failure(let error) = completion else {
                    return
                }
                XCTFail(error.localizedDescription)
                expectationFailure.fulfill()
            } receiveValue: { response in
                // then
                XCTAssertNotNil(response)
                successExpectation.fulfill()
            }
        
        //Then
        self.wait(for: [expectationFailure, successExpectation], timeout: 1)
        self.cancellable?.cancel()
    }
    
    func testInterRepositories_whenGetVersion_ResponseFailure() {
        //Given
        let expectationFailure = expectation(description: "failure")
        let expectation = expectation(description: "Consume Web Service Response Expectation")
        expectation.isInverted = true
        NetworkServiceMock.response = TestDataConstants.versionResponse as AnyObject
        NetworkServiceMock.error = NetworkError.emptyJson
        
        //When
        self.cancellable = sut.getVersion()
            .sink(receiveCompletion: { completion in
                guard case .failure(let error) = completion else { return
                    XCTFail("completion is not a failure")
                }
                XCTAssertEqual(error.localizedDescription, NetworkError.emptyJson.localizedDescription)
                expectationFailure.fulfill()
            },
                  receiveValue: { _ in
                // Then
                expectation.fulfill()
            })
        
        //Then
        self.wait(for: [expectationFailure, expectation], timeout: 1)
        self.cancellable?.cancel()
    }
    
    func testInterRepositories_whenGetSchemes_ResponseSuccess() {
        //Given
        let expectationFailure = expectation(description: "failure")
        let successExpectation = expectation(description: "Consume Web Service Response Expectation")
        expectationFailure.isInverted = true
        
        NetworkServiceMock.response = TestDataConstants.schemesResponse as AnyObject
        
        //When
        self.cancellable = sut.getSchemes()
            .sink { completion in
                guard case .failure(let error) = completion else {
                    return
                }
                XCTFail(error.localizedDescription)
                expectationFailure.fulfill()
            } receiveValue: { response in
                // then
                XCTAssertNotNil(response)
                successExpectation.fulfill()
            }
        
        //Then
        self.wait(for: [expectationFailure, successExpectation], timeout: 1)
        self.cancellable?.cancel()
    }
    
    func testInterRepositories_whenGetSchemes_ResponseFailure() {
        //Given
        let expectationFailure = expectation(description: "failure")
        let expectation = expectation(description: "Consume Web Service Response Expectation")
        expectation.isInverted = true
        NetworkServiceMock.response = TestDataConstants.schemesResponse as AnyObject
        NetworkServiceMock.error = NetworkError.emptyJson
        
        //When
        self.cancellable = sut.getSchemes()
            .sink(receiveCompletion: { completion in
                guard case .failure(let error) = completion else { return
                    XCTFail("completion is not a failure")
                }
                XCTAssertEqual(error.localizedDescription, NetworkError.emptyJson.localizedDescription)
                expectationFailure.fulfill()
            },
                  receiveValue: { _ in
                // Then
                expectation.fulfill()
            })
        
        //Then
        self.wait(for: [expectationFailure, expectation], timeout: 1)
        self.cancellable?.cancel()
    }
    
    func testInterRepositories_whenGetLocalities_ResponseSuccess() {
        //Given
        let expectationFailure = expectation(description: "failure")
        let successExpectation = expectation(description: "Consume Web Service Response Expectation")
        expectationFailure.isInverted = true
        
        NetworkServiceMock.response = TestDataConstants.localitiesResponse as AnyObject
        
        //When
        self.cancellable = sut.getLocalities()
            .sink { completion in
                guard case .failure(let error) = completion else {
                    return
                }
                XCTFail(error.localizedDescription)
                expectationFailure.fulfill()
            } receiveValue: { response in
                // then
                XCTAssertNotNil(response)
                successExpectation.fulfill()
            }
        
        //Then
        self.wait(for: [expectationFailure, successExpectation], timeout: 1)
        self.cancellable?.cancel()
    }
    
    func testInterRepositories_whenGetLocalities_ResponseFailure() {
        //Given
        let expectationFailure = expectation(description: "failure")
        let expectation = expectation(description: "Consume Web Service Response Expectation")
        expectation.isInverted = true
        NetworkServiceMock.response = TestDataConstants.localitiesResponse as AnyObject
        NetworkServiceMock.error = NetworkError.emptyJson
        
        //When
        self.cancellable = sut.getLocalities()
            .sink(receiveCompletion: { completion in
                guard case .failure(let error) = completion else { return
                    XCTFail("completion is not a failure")
                }
                XCTAssertEqual(error.localizedDescription, NetworkError.emptyJson.localizedDescription)
                expectationFailure.fulfill()
            },
                  receiveValue: { _ in
                // Then
                expectation.fulfill()
            })
        
        //Then
        self.wait(for: [expectationFailure, expectation], timeout: 1)
        self.cancellable?.cancel()
    }
}
