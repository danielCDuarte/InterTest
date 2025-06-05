//
//  NavigationButton.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 4/06/25.
//

import SkeletonUI
import SwiftUI

struct NavigationButton: View {
    var icon: String
    var title: String
    var loading: Bool
    
    init(icon: String, title: String, loading: Bool) {
        self.icon = icon
        self.title = title
        self.loading = loading
    }
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .font(.title2)
            Text(title)
                .font(.headline)
            Spacer()
            Image(systemName: "chevron.right")
        }
        .padding()
        .skeleton(with: loading, shape: .rectangle)
        .disabled(loading)
        .foregroundColor(.white)
        .background(.cyan)
        .cornerRadius(12)
    }
}


