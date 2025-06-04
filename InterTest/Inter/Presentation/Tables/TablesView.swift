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
        NavigationStack {
            SkeletonList(with: viewModel.state.searchText.isEmpty ? viewModel.state.schemes : viewModel.state.searchSchemes ,
                         quantity: viewModel.state.numberSkeletonCell) { loading, scheme in
                TableCellView(scheme: scheme, loading: loading)
            }
            .listStyle(.inset)
            .navigationBarTitle(TablesState.Constants.title, displayMode: .inline)
            .searchable(
                text: $viewModel.state.searchText,
                placement: .navigationBarDrawer(displayMode: .always)
            )
            .textInputAutocapitalization(.never)
            .onChange(of: viewModel.state.searchText) {
                viewModel.searchTables(query: viewModel.state.searchText)
            }
        }
        .onAppear {
            viewModel.onAppear()
        }
        .onDisappear {
            viewModel.onDisAppear()
        }
        .alert(isPresented: $viewModel.state.alert) {
            Alert(
                title: Text(TablesState.Constants.error),
                message: Text(TablesState.Constants.errorMessage),
                dismissButton: .cancel(Text(TablesState.Constants.accept)))
        }
    }
}
