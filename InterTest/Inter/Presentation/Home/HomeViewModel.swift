//
//  HomeViewModel.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 3/06/25.
//

import Combine
import Resolver
import Foundation

final class HomeViewModel: BaseViewModel {
    
    private var oAuth: OauthObject?
    private var subscribers: Set<AnyCancellable> = []
    @Published var state = HomeState()
    
    private let getVersionUseCase: AnyUseCase<Any?, String>
    private let postValidateOAuthUseCase: AnyUseCase<UserParamsObject, OauthObject>
    private let persistenceService: PersistenceServiceType
    
    init(getVersionUseCase: AnyUseCase<Any?, String>,
         postValidateOAuthUseCase: AnyUseCase<UserParamsObject, OauthObject>,
         persistenceService: PersistenceServiceType) {
        self.getVersionUseCase = getVersionUseCase
        self.postValidateOAuthUseCase = postValidateOAuthUseCase
        self.persistenceService = persistenceService
        super.init()
        errorHandler = self
    }
    
    private func getVersion() {
        getVersionUseCase.execute(params: nil)
            .sink { [weak self] completion in
                guard case .failure(let error) = completion else { return }
                self?.showError(error: error)
            } receiveValue: { [weak self] version in
                self?.bindVersion(with: version)
            }
            .store(in: &subscribers)
    }
    
    private func bindVersion(with version: String) {
        let versionBundle = Bundle.main.releaseVersionNumber
        if version != versionBundle {
            state.alertUpdateVersion = true
            state.versionUpdateMessage =  "\(HomeState.Constants.versionUpdateMessage) \(version)"
            objectWillChange.send()
        }
    }
    
    private func postValidateOAuth(){
        postValidateOAuthUseCase.execute(params:
                .init(
                    mac: "",
                    nameAplication: "Controller APP",
                    password: "SW50ZXIyMDIx\n",
                    path: "",
                    userName: "cGFtLm1lcmVkeTIx\n")
        ).sink { [weak self] completion in
                guard case .failure(let error) = completion else { return }
                self?.showError(error: error)
            } receiveValue: { [weak self] oAuth in
                self?.bindUser(with: oAuth)
            }
            .store(in: &subscribers)
    }
    
    private func bindUser(with oAuth: OauthObject) {
        state.oAuth = oAuth
        state.isLoading = false
        objectWillChange.send()
    }
}

extension HomeViewModel: HomeViewModelType {
    func onAppear() {
        getVersion()
        postValidateOAuth()
    }
    
    func onDisAppear() {
        loading = false
    }
}

extension HomeViewModel: BaseView {
    func showError(error: Error) {
        state.alert = true
        objectWillChange.send()
    }
}
