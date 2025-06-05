//
//  FetchTablesModelUseCaseTest.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 4/06/25.
//

import Combine
import Resolver
@testable import InterTest
import XCTest

class FetchTablesModelUseCaseTest: XCTestCase {
    private var sut: FetchTablesModelUseCase!
    @LazyInjected var persistenceRepositories: PersistenceRepositoriesStub
    private var cancellable: AnyCancellable?
    
    override func setUpWithError() throws {
        Resolver.registerDomainMockServices()
        sut = .init(persistenceRepositories: Resolver.resolve(PersistenceRepositoriesType.self))
    }
    
    override func tearDownWithError() throws {
        sut = nil
        cancellable = nil
        PersistenceRepositoriesStub.error = nil
        PersistenceRepositoriesStub.responseSave = nil
        PersistenceRepositoriesStub.responseFetchUserModel = nil
        PersistenceRepositoriesStub.responseFetchTablesModel = nil
    }
    
    func testFetchTablesModelUse_ResponseSuccess() {
        //Given
        let expectationFailure = expectation(description: "failure")
        let expectation = self.expectation(description: "Consume persistence Service Response Expectation")
        expectationFailure.isInverted = true
        
        PersistenceRepositoriesStub.responseFetchTablesModel = TestDomainConstants.schemesResponse
        
        //When
        cancellable = sut.execute(params: nil)
            .sink { completion in
                guard case .failure(let error) = completion else { return }
                XCTFail(error.localizedDescription)
                expectationFailure.fulfill()
            } receiveValue: { response in
                // Then
                XCTAssertFalse(response.isEmpty)
                expectation.fulfill()
            }
        
        wait(for: [expectationFailure, expectation], timeout: 1)
        cancellable?.cancel()
    }
    
    func testFetchTablesModelUse_ResponseError() {
        //Given
        let expectationFailure = expectation(description: "failure")
        let expectation = self.expectation(description: "Consume persistence Service Response Expectation")
        expectation.isInverted = true
        
        PersistenceRepositoriesStub.error = NetworkError.emptyJson
        
        //When
        cancellable = sut.execute(params: nil)
            .sink(
                receiveCompletion: { completion in
                    guard case .failure(let error) = completion else { return
                        XCTFail("completion is not a failure")
                    }
                    // Then
                    let jsonEmptyError = NetworkError.emptyJson.localizedDescription
                    XCTAssertEqual(error.localizedDescription, jsonEmptyError)
                    expectationFailure.fulfill()
                },
                receiveValue: { _ in
                    expectation.fulfill()
                })
        
        wait(for: [expectationFailure, expectation], timeout: 1)
        cancellable?.cancel()
    }
}
