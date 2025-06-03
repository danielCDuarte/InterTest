//
//  DataConstants.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 1/06/25.
//

import Foundation

struct DataConstants {
    enum APIClient {
        static let contentType: String = "Content-Type"
    }
    
    enum InnerConstants {
        static let applicationJson: String = "application/json"
    }
    
    struct WS {
        static let getVersion: String = "apicontrollerpruebas/api/ParametrosFramework/ConsultarParametrosFramework/VPStoreAppControl"
        static let postOAuth: String = "FtEntregaElectronica/MultiCanales/ApiSeguridadPruebas/api/Seguridad/AuthenticaUsuarioApp"
        static let getSchemes: String = "apicontrollerpruebas/api/SincronizadorDatos/ObtenerEsquema/true"
        static let getLocalities: String = "apicontrollerpruebas/api/ParametrosFramework/ObtenerLocalidadesRecogidas"
    }
    
    static let baseUrl: String = "https://apitesting.interrapidisimo.co/"
}
