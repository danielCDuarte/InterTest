//
//  TableCellView.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 4/06/25.
//

import SkeletonUI
import SwiftUI

struct TableCellView: View {
    
    var scheme: SchemeObject?
    var loading: Bool
    
    
    init(scheme: SchemeObject?,
         loading: Bool) {
        self.scheme = scheme
        self.loading = loading
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(scheme?.nameTable)
                .font(.subheadline)
                .foregroundColor(.black)
                .skeleton(with: loading , shape: .rectangle)
            Text(scheme?.updateDate)
                .font(.subheadline)
                .foregroundColor(.gray)
                .skeleton(with: loading , shape: .rectangle)
            Spacer()
        }
    }
}

#Preview {
    TableCellView(scheme: .init(nameTable: "AbreviaturasDireccion",batchSize: 12, numberOfFields: 12, updateDate: "2024-02-15T15:46:45.777"), loading: true)
}
