//
//  LocalityCellView.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 4/06/25.
//

import SkeletonUI
import SwiftUI

struct LocalityCellView: View {
    
    var locality: LocalityObject?
    var loading: Bool
    
    
    init(locality: LocalityObject?,
         loading: Bool) {
        self.locality = locality
        self.loading = loading
    }
    
    var body: some View {
        HStack(spacing: 10) {
            Text(locality?.name)
                .font(.subheadline)
                .foregroundColor(.black)
                .skeleton(with: loading , shape: .rectangle)
            Text(locality?.cityAbbreviation)
                .font(.subheadline)
                .foregroundColor(.gray)
                .skeleton(with: loading , shape: .rectangle)
            Spacer()
        }
    }
}

#Preview {
    LocalityCellView(locality: .init(id: "1", name: "Medellin", cityAbbreviation: "MDE"), loading: true)
}
