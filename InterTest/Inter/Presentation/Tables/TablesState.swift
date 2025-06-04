//
//  TablesState.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 3/06/25.
//

import Foundation
import SwiftUI

final class TablesState: ObservableObject {
    @Published var schemes: [SchemeObject] = []
    @Published var searchSchemes: [SchemeObject] = []
    @Published var isLoading: Bool = true
    @Published var numberSkeletonCell: Int = 8
    @Published var alert: Bool = false
    @Published var searchText = ""
    
    enum Constants {
        static let title = "Tablas"
        static let error = "Error"
        static let errorMessage = "Se produjo un error, vuelve a intentarlo más tarde"
        static let accept = "Aceptar"
    }
}
