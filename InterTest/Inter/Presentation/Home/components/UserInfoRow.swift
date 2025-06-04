//
//  userInfoRow.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 4/06/25.
//

import SkeletonUI
import SwiftUI

struct UserInfoRow: View {
    var icon: String
    var title: String?
    var loading: Bool
    
    init(icon: String,
         title: String?,
         loading: Bool) {
        self.icon = icon
        self.title = title
        self.loading = loading
    }
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.secondary)
                .frame(width: 24)
            Text(title)
                .skeleton(with: loading , shape: .rectangle)
                .font(.subheadline)
            Spacer()
        }
    }
}

#Preview {
    UserInfoRow(icon: "person", title: "Daniel", loading: false)
}
