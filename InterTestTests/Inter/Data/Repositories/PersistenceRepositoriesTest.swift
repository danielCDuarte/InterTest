//
//  PersistenceRepositoriesTest.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 4/06/25.
//

import Foundation
import XCTest
import Combine

@testable import InterTest

final class PersistenceRepositoriesTest: XCTestCase {
    private var cancellable: AnyCancellable?
    private var persistenceService: PersistenceServiceType!
    private var sut: PersistenceRepositoriesType!

    override func setUp() {
        super.setUp()
        persistenceService = PersistenceServiceMock()
        sut = PersistenceRepositories(persistenceService: persistenceService)
    }
    
    override func tearDown() {
        PersistenceServiceMock.response = nil
        PersistenceServiceMock.error = nil
        sut = nil
        cancellable = nil
        super.tearDown()
    }
    
    func testPersistenceRepositories_whenSaveUserModel_ResponseSuccess() {
        //Given
        let expectationFailure = expectation(description: "failure")
        let successExpectation = expectation(description: "Consume persistence Service Response Expectation")
        expectationFailure.isInverted = true
        
        //When
        self.cancellable = sut.saveUserModel(user: TestDataConstants.userModel)
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
    
    func testPersistenceRepositories_whenSaveUserModel_ResponseFailure() {
        //Given
        let expectationFailure = expectation(description: "failure")
        let expectation = expectation(description: "Consume persistence Service Response Expectation")
        expectation.isInverted = true
        PersistenceServiceMock.error = NetworkError.emptyJson
        
        //When
        self.cancellable = sut.saveUserModel(user: TestDataConstants.userModel)
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
    
    func testPersistenceRepositories_whenFetchUserModel_ResponseSuccess() {
        //Given
        let expectationFailure = expectation(description: "failure")
        let successExpectation = expectation(description: "Consume persistence Service Response Expectation")
        expectationFailure.isInverted = true
        
        PersistenceServiceMock.response = [TestDataConstants.userModel] as [Any]
        //When
        self.cancellable = sut.fetchUserModel()
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
    
    func testPersistenceRepositorieswhenFetchUserModels_ResponseFailureEmpty() {
        //Given
        let expectationFailure = expectation(description: "failure")
        let expectation = expectation(description: "Consume persistence Service Response Expectation")
        expectation.isInverted = true
        PersistenceServiceMock.response = [] as [Any]
        
        //When
        self.cancellable = sut.fetchUserModel()
            .sink(receiveCompletion: { completion in
                guard case .failure(let error) = completion else { return
                    XCTFail("completion is not a failure")
                }
                XCTAssertEqual(error.localizedDescription, PersistenceError.itemNotFound.localizedDescription)
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
    
    func testPersistenceRepositories_whenFetchUserModels_ResponseFailure() {
        //Given
        let expectationFailure = expectation(description: "failure")
        let expectation = expectation(description: "Consume persistence Service Response Expectation")
        expectation.isInverted = true
        PersistenceServiceMock.error = NetworkError.emptyJson
        
        //When
        self.cancellable = sut.fetchUserModel()
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
    
    func testPersistenceRepositories_whenSaveTableModel_ResponseSuccess() {
        //Given
        let expectationFailure = expectation(description: "failure")
        let successExpectation = expectation(description: "Consume persistence Service Response Expectation")
        expectationFailure.isInverted = true
        
        //When
        self.cancellable = sut.saveTableModel(scheme: TestDataConstants.schemeModel)
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
    
    func testPersistenceRepositories_whenSaveTableModel_ResponseFailure() {
        //Given
        let expectationFailure = expectation(description: "failure")
        let expectation = expectation(description: "Consume persistence Service Response Expectation")
        expectation.isInverted = true
        PersistenceServiceMock.error = NetworkError.emptyJson
        
        //When
        self.cancellable = sut.saveTableModel(scheme: TestDataConstants.schemeModel)
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
    
    func testPersistenceRepositories_whenFetchTablesModel_ResponseSuccess() {
        //Given
        let expectationFailure = expectation(description: "failure")
        let successExpectation = expectation(description: "Consume persistence Service Response Expectation")
        expectationFailure.isInverted = true
        
        PersistenceServiceMock.response = [TestDataConstants.schemeModel] as [Any]
        //When
        self.cancellable = sut.fetchTablesModel()
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
    
    func testPersistenceRepositories_whenFetchTablesModel_ResponseFailure() {
        //Given
        let expectationFailure = expectation(description: "failure")
        let expectation = expectation(description: "Consume persistence Service Response Expectation")
        expectation.isInverted = true
        PersistenceServiceMock.error = NetworkError.emptyJson
        
        //When
        self.cancellable = sut.fetchTablesModel()
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
    
    func testPersistenceRepositories_whenFetchTablesModel_ResponseFailureEmpty() {
        //Given
        let expectationFailure = expectation(description: "failure")
        let expectation = expectation(description: "Consume persistence Service Response Expectation")
        expectation.isInverted = true
        PersistenceServiceMock.response = [] as [Any]
        
        //When
        self.cancellable = sut.fetchTablesModel()
            .sink(receiveCompletion: { completion in
                guard case .failure(let error) = completion else { return
                    XCTFail("completion is not a failure")
                }
                XCTAssertEqual(error.localizedDescription, PersistenceError.itemNotFound.localizedDescription)
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
