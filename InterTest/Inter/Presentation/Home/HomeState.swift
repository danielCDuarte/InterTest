//
//  HomeState.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 3/06/25.
//

import Foundation
import SwiftUI

final class HomeState: ObservableObject {
    @Published var oAuth: OauthObject?
    @Published var isLoading: Bool = true
    @Published var alert: Bool = false
    @Published var alertUpdateVersion: Bool = false
    @Published var versionUpdateMessage: String = ""
    
    enum Constants {
        static let title = "Home"
        static let error = "Error"
        static let errorMessage = "Se produjo un error, vuelve a intentarlo más tarde"
        static let accept = "Aceptar"
        static let versionUpdate = "Versión desactualizada"
        static let versionUpdateMessage = "Actualice la versión de la app a la #:"
        static let name = "Usuario: "
        static let username = "Nombre de usuario: "
        static let schemes = "Tablas"
        static let localities = "Localidades"
    }
}
