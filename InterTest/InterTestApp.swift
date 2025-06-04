//
//  InterTestApp.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 1/06/25.
//

import SwiftUI

@main
struct InterTestApp: App {
    let factory = Factory(baseUrl: DataConstants.baseUrl)

    var body: some Scene {
        WindowGroup {
            HomeView<HomeViewModel>()
        }
    }
}
