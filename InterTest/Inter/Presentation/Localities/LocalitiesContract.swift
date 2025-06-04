//
//  LocalitiesContract.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 3/06/25.
//

import Foundation
import SwiftUI

protocol LocalitiesViewModelType: ObservableObject {
    var state: LocalitiesState { get set }
    func searchLocalities(query: String)
    func onAppear()
    func onDisAppear()
}
