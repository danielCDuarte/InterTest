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
        static let versions: String = ""
        static let oAuth: String = ""
        static let sync: String = ""
        static let localities: String = ""
    }
    
    static let baseUrl: String = "https://apitesting.interrapidisimo.co/FtEntregaElectronica/MultiCanales/ApiSeguridadPruebas/api/"
}
