//
//  LocalitiesViewModel.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 3/06/25.
//

import Combine
import Resolver
import Foundation

final class LocalitiesViewModel: BaseViewModel {
    private var localities: [LocalityObject]?
    private var subscribers: Set<AnyCancellable> = []
    @Published var state = LocalitiesState()
    private let getLocalitiesUseCase: AnyUseCase<Any?, [LocalityObject]>
    
    init(getLocalitiesUseCase: AnyUseCase<Any?, [LocalityObject]>) {
        self.getLocalitiesUseCase = getLocalitiesUseCase
        super.init()
        errorHandler = self
    }
    
    private func getLocalities() {
        getLocalitiesUseCase.execute(params: nil)
            .sink { [weak self] completion in
                guard case .failure(let error) = completion else { return }
                self?.showError(error: error)
            } receiveValue: { [weak self] localities in
                self?.bindLocalities(with: localities)
            }
            .store(in: &subscribers)
    }
    
    private func bindLocalities(with localitiesObject: [LocalityObject]) {
        localities = localitiesObject
        state.localities = localitiesObject
        state.isLoading = false
        objectWillChange.send()
    }
    
    private func searchLocalities(by query: String) {
        let filterResults = localities?.filter { localities in
            localities.name
                .lowercased()
                .contains(query)
        } ?? []
        state.searchLocalities = filterResults
        state.isLoading = false
        objectWillChange.send()
    }
    
}

extension LocalitiesViewModel: LocalitiesViewModelType {
  
    func searchLocalities(query: String) {
        searchLocalities(by: query)
    }
    
    func onAppear() {
        getLocalities()
    }
    
    func onDisAppear() {
        loading = false
    }
    
}

extension LocalitiesViewModel: BaseView {
    func showError(error: Error) {
        state.alert = true
        objectWillChange.send()
    }
}

