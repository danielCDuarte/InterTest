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
    
    @Published var state = TablesState()
    
    override init() {
        super.init()
        errorHandler = self
    }
}

extension TablesViewModel: TablesViewModelType {
    func onAppear() {
        
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
