//
//  InterRepositories.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 1/06/25.
//

import Combine
import Foundation

class InterRepositories: InterRepositoriesType {
    
    private(set) var networkService: NetworkServiceType
    
    init(networkService: NetworkServiceType) {
        self.networkService = networkService
    }
    
    private struct Constants {
        static let headers: [String: String] = [
            "Usuario": "pam.meredy21",
            "Identificacion": "987204545",
            "IdUsuario": "pam.meredy21",
            "IdCentroServicio": "1295",
            "NombreCentroServicio": "PTO/BOGOTA/CUND/COL/OF PRINCIPAL - CRA 30 # 7-45",
            "IdAplicativoOrigen": "9"
        ]
    }
    
    func getVersion() -> AnyPublisher<String, any Error> {
        let endPoint = NetworkRequest<String>(
            method: .GET,
            relativePath:DataConstants.WS.getVersion,
            parameters: nil
        )
        
        return networkService.request(endPoint,
                                      queue: .main)
        .eraseToAnyPublisher()
    }
    
    func postValidateOAuth(_ userParams: UserParamsObject) -> AnyPublisher<OauthObject, any Error> {
        let endPoint = NetworkRequest<APIOauthResponse>(
            method: .POST,
            relativePath:DataConstants.WS.postOAuth,
            headers: Constants.headers,
            parameters: [
                "Mac": userParams.mac,
                "NomAplicacion": userParams.nameAplication,
                "Password": userParams.password,
                "Path": userParams.path,
                "Usuario": userParams.userName
            ],
        )
        
        return networkService.request(endPoint,
                                      queue: .main)
        .map { OauthMapper.map(input: $0) }
        .eraseToAnyPublisher()
    }
    
    func getSchemes() -> AnyPublisher<[SchemeObject], any Error> {
        let endPoint = NetworkRequest<[APISchemeResponse]>(
            method: .GET,
            relativePath:DataConstants.WS.getSchemes,
            headers: Constants.headers,
            parameters: nil
        )
        
        return networkService.request(endPoint,
                                      queue: .main)
        .map { SchemeMapper.map(input: $0) }
        .eraseToAnyPublisher()
    }
    
    func getLocalities() -> AnyPublisher<[LocalityObject], any Error> {
        let endPoint = NetworkRequest<[APILocalityResponse]>(
            method: .GET,
            relativePath:DataConstants.WS.getLocalities,
            headers: Constants.headers,
            parameters: nil
        )
        
        return networkService.request(endPoint,
                                      queue: .main)
        .map { LocalitiesMapper.map(input: $0) }
        .eraseToAnyPublisher()
    }
    
}
