//
//  TablesView.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 3/06/25.
//

import Resolver
import SwiftUI
import SkeletonUI
import MapKit

struct TablesView<ViewModelType>: View where ViewModelType: TablesViewModelType {
    @ObservedObject var viewModel: ViewModelType = Resolver.resolve()
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            
        }
        .onAppear {
            viewModel.onAppear()
        }
        .onDisappear {
            viewModel.onDisAppear()
        }
        .navigationBarTitle(TablesState.Constants.title, displayMode: .inline)
        .alert(isPresented: $viewModel.state.alert) {
            Alert(
                title: Text(TablesState.Constants.error),
                message: Text(TablesState.Constants.error),
                dismissButton: .cancel(Text(TablesState.Constants.ok)))
        }
    }
}
