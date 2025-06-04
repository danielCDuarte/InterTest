//
//  TablesState.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 3/06/25.
//

import Foundation
import SwiftUI

final class TablesState: ObservableObject {
    @Published var isLoading: Bool = true
    @Published var numberSkeletonCell: Int = 8
    @Published var alert: Bool = false
    @Published var searchText = ""
    
    enum Constants {
        static let title = "Tablas"
        static let error = "Error"
        static let errorMessage = "An error has occurred"
        static let ok = "Ok"
    }
}
