//
//  TablesViewModel.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 3/06/25.
//

import Combine
import Resolver
import Foundation

final class TablesViewModel: BaseViewModel {
    private var schemes: [SchemeObject]?
    private var subscribers: Set<AnyCancellable> = []
    @Published var state = TablesState()
    private let getSchemesUseCase: AnyUseCase<Any?, [SchemeObject]>
    
    init(getSchemesUseCase: AnyUseCase<Any?, [SchemeObject]>) {
        self.getSchemesUseCase = getSchemesUseCase
        super.init()
        errorHandler = self
    }
    
    private func getSchemes() {
        getSchemesUseCase.execute(params: nil)
            .sink { [weak self] completion in
                guard case .failure(let error) = completion else { return }
                self?.showError(error: error)
            } receiveValue: { [weak self] schemes in
                self?.bindSchemes(with: schemes)
            }
            .store(in: &subscribers)
    }
    
    private func bindSchemes(with schemesObject: [SchemeObject]) {
        schemes = schemesObject
        state.schemes = schemesObject
        state.isLoading = false
        objectWillChange.send()
    }
    
    private func searchSchemes(by query: String) {
        let filterResults = schemes?.filter { scheme in
            scheme.nameTable?
                .lowercased()
                .contains(query.lowercased()) ?? false
        } ?? []
        state.searchSchemes = filterResults
        state.isLoading = false
        objectWillChange.send()
    }
    
}

extension TablesViewModel: TablesViewModelType {
  
    func searchTables(query: String) {
        searchSchemes(by: query)
    }
    
    func onAppear() {
        getSchemes()
    }
    
    func onDisAppear() {
        loading = false
    }
    
}

extension TablesViewModel: BaseView {
    func showError(error: Error) {
        state.alert = true
        objectWillChange.send()
    }
}
