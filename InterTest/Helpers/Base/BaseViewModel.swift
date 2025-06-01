//
//  BaseViewModel.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 1/06/25.
//

import Foundation

class BaseViewModel: NSObject, BaseViewModelProtocol, ErrorProcessorProtocol {
    var view: BaseView?
    weak var errorHandler: ErrorHandlerProtocol?
    
    var loading: Bool = false {
        didSet {
            if self.loading {
            } else {}
        }
    }
    
    func bind(withView view: BaseView) {
        self.view = view
        self.errorHandler = view
    }
    
    func unBind() {
        self.view = nil
        self.errorHandler = nil
    }
    
    func viewAppear() {}
    
    func viewDidAppear() {}
    
    func getInitialState() {}
}
