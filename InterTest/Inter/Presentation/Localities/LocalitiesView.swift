//
//  LocalitiesView.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 3/06/25.
//

import Resolver
import SwiftUI
import SkeletonUI
import MapKit

struct LocalitiesView<ViewModelType>: View where ViewModelType: LocalitiesViewModelType {
    @ObservedObject var viewModel: ViewModelType = Resolver.resolve()
    
    var body: some View {
        NavigationStack {
            SkeletonList(with: viewModel.state.searchText.isEmpty ? viewModel.state.localities : viewModel.state.searchLocalities , quantity: viewModel.state.numberSkeletonCell) { loading, locality in
                LocalityCellView(locality: locality, loading: loading)
            }
            .listStyle(.inset)
            .navigationBarTitle(LocalitiesState.Constants.title, displayMode: .inline)
            .searchable(
                text: $viewModel.state.searchText,
                placement: .navigationBarDrawer(displayMode: .always)
            )
            .textInputAutocapitalization(.never)
            .onChange(of: viewModel.state.searchText) {
                viewModel.searchLocalities(query: viewModel.state.searchText)
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
                title: Text(LocalitiesState.Constants.error),
                message: Text(LocalitiesState.Constants.errorMessage),
                dismissButton: .cancel(Text(LocalitiesState.Constants.accept)))
        }
    }
}
