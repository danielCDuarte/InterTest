//
//  GetVersionUseCaseTest.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 3/06/25.
//

import Combine
import Resolver
@testable import InterTest
import XCTest

class GetVersionUseCaseTest: XCTestCase {
    private var sut: GetVersionUseCase!
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
    
    func testGetVersionUseCase_ResponseSuccess() {
        //Given
        let expectationFailure = expectation(description: "failure")
        let expectation = self.expectation(description: "Consume Web Service Response Expectation")
        expectationFailure.isInverted = true
        
        InterRepositoriesStub.responseVersion = TestDomainConstants.versionResponse
        
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
    
    func testGetVersionUseCase_ResponseError() {
        //Given
        let expectationFailure = expectation(description: "failure")
        let expectation = self.expectation(description: "Consume Web Service Response Expectation")
        expectation.isInverted = true
        
        InterRepositoriesStub.error = NetworkError.emptyJson
        
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
