//
//  TablesContract.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 3/06/25.
//

import Foundation
import SwiftUI

protocol TablesViewModelType: ObservableObject {
    var state: TablesState { get set }
    func searchTables(query: String)
    func onAppear()
    func onDisAppear()
}
