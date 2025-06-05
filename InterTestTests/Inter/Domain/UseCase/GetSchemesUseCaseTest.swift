//
//  GetSchemesUseCaseTest.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 3/06/25.
//

import Combine
import Resolver
@testable import InterTest
import XCTest

class GetSchemesUseCaseTest: XCTestCase {
    private var sut: GetSchemesUseCase!
    @LazyInjected var interRepositories: InterRepositoriesStub
    private var cancellable: AnyCancellable?
    
    override func setUpWithError() throws {
        Resolver.registerDomainMockServices()
        sut = .init(repository: Resolver.resolve(InterRepositoriesType.self))
    }
    
    override func tearDownWithError() throws {
        sut = nil
        cancellable = nil
        InterRepositoriesStub.error = nil
        InterRepositoriesStub.responseVersion = nil
        InterRepositoriesStub.responsePostValidateOAuth = nil
        InterRepositoriesStub.responseGetSchemes = nil
        InterRepositoriesStub.responseGetLocalities = nil
    }
    
    func testGetSchemesUseCase_ResponseSuccess() {
        //Given
        let expectationFailure = expectation(description: "failure")
        let expectation = self.expectation(description: "Consume Web Service Response Expectation")
        expectationFailure.isInverted = true
        
        InterRepositoriesStub.responseGetSchemes = TestDomainConstants.schemesResponse
        
        //When
        cancellable = sut.execute(params: "")
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
    
    func testGetSchemesUseCase_ResponseError() {
        //Given
        let expectationFailure = expectation(description: "failure")
        let expectation = self.expectation(description: "Consume Web Service Response Expectation")
        expectation.isInverted = true
        
        InterRepositoriesStub.error = NetworkError.emptyJson
        
        //When
        cancellable = sut.execute(params: "")
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
