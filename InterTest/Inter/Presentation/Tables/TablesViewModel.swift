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
    
    private let getSchemesUseCase: AnyUseCase<String, [SchemeObject]>
    private let fetchTablesModelUseCase: AnyUseCase<Any?, [SchemeObject]>
    private let saveSchemeUseCase: AnyUseCase<SchemeObject, Void>
    
    init(
        getSchemesUseCase: AnyUseCase<String, [SchemeObject]>,
        fetchTablesModelUseCase: AnyUseCase<Any?, [SchemeObject]>,
        saveSchemeUseCase: AnyUseCase<SchemeObject, Void>) {
            self.getSchemesUseCase = getSchemesUseCase
            self.fetchTablesModelUseCase = fetchTablesModelUseCase
            self.saveSchemeUseCase = saveSchemeUseCase
            super.init()
            errorHandler = self
        }
    
    private func getSchemes() {
        getSchemesUseCase.execute(params: "")
            .sink { [weak self] completion in
                guard case .failure(let error) = completion else { return }
                self?.showError(error: error)
            } receiveValue: { [weak self] schemes in
                self?.bindSchemes(with: schemes)
            }
            .store(in: &subscribers)
    }
    
    private func bindSchemes(with schemesObject: [SchemeObject]) {
        schemesObject.publisher
            .flatMap(maxPublishers: .max(1)) { scheme in
                self.saveSchemeUseCase.execute(params: scheme)
                    .catch { error -> AnyPublisher<Void, Never> in
                        self.showError(error: error)
                        return Just(()).eraseToAnyPublisher()
                    }
            }
            .collect()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.validateSchemes()
            }
            .store(in: &subscribers)
    }
    
    private func validateSchemes() {
        fetchTablesModelUseCase.execute(params: nil)
            .sink { [weak self] completion in
                guard case .failure(let error) = completion else { return }
                switch error {
                case PersistenceError.itemNotFound:
                    self?.getSchemes()
                default:
                    self?.showError(error: error)
                }
                
            } receiveValue: { [weak self] schemes in
                self?.bindvalidateSchemes(schemes)
            }
            .store(in: &subscribers)
    }
    
    private func bindvalidateSchemes(_ schemesValidate: [SchemeObject]) {
        schemes = schemesValidate
        state.schemes = schemesValidate
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
        validateSchemes()
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
