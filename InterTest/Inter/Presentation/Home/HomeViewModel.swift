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
    private let fetchUserModelUseCase: AnyUseCase<Any?, OauthObject>
    private let saveOauthUseCase: AnyUseCase<OauthObject, Void>
    
    init(
        getVersionUseCase: AnyUseCase<Any?, String>,
        postValidateOAuthUseCase: AnyUseCase<UserParamsObject, OauthObject>,
        fetchUserModelUseCase: AnyUseCase<Any?, OauthObject>,
        saveOauthUseCase: AnyUseCase<OauthObject, Void>) {
            self.getVersionUseCase = getVersionUseCase
            self.postValidateOAuthUseCase = postValidateOAuthUseCase
            self.fetchUserModelUseCase = fetchUserModelUseCase
            self.saveOauthUseCase = saveOauthUseCase
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
    
    private func validateOAuth() {
        fetchUserModelUseCase.execute(params: nil)
            .sink { [weak self] completion in
                guard case .failure(let error) = completion else { return }
                switch error {
                case PersistenceError.itemNotFound:
                    self?.postValidateOAuth()
                default:
                    self?.showError(error: error)
                }
                
            } receiveValue: { [weak self] user in
                self?.bindvalidateOAuth(user)
            }
            .store(in: &subscribers)
    }
    
    private func bindvalidateOAuth(_ user: OauthObject) {
        oAuth = user
        state.oAuth = user
        state.isLoading = false
        objectWillChange.send()
    }
    
    private func postValidateOAuth(){
        postValidateOAuthUseCase.execute(params:
                .init(
                    mac: "",
                    nameAplication: "Controller APP",
                    password: "SW50ZXIyMDIx\n",
                    path: "",
                    userName: "cGFtLm1lcmVkeTIx\n"
                )
        ).sink { [weak self] completion in
            guard case .failure(let error) = completion else { return }
            self?.showError(error: error)
        } receiveValue: { [weak self] oAuth in
            self?.bindUser(with: oAuth)
        }
        .store(in: &subscribers)
    }
    
    private func bindUser(with oAuth: OauthObject) {
        saveOauthUseCase.execute(params: oAuth)
            .sink { [weak self] completion in
                guard case .failure(let error) = completion else { return }
                self?.showError(error: error)
            } receiveValue: { [weak self] in
                self?.validateOAuth()
            }
            .store(in: &subscribers)
    }
}

extension HomeViewModel: HomeViewModelType {
    func onAppear() {
        getVersion()
        validateOAuth()
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
