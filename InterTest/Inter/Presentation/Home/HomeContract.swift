//
//  HomeContract.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 3/06/25.
//

import Foundation
import SwiftUI

protocol HomeViewModelType: ObservableObject {
    var state: HomeState { get set }
    func onAppear()
    func onDisAppear()
}
