//
//  HomeView.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 3/06/25.
//

import Resolver
import SwiftUI
import SkeletonUI
import MapKit

struct HomeView<ViewModelType>: View where ViewModelType: HomeViewModelType {
    @ObservedObject var viewModel: ViewModelType = Resolver.resolve()
    @State private var navigationPath = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            VStack(alignment: .center, spacing: 20) {
                VStack(alignment: .leading, spacing: 12) {
                    UserInfoRow(
                        icon: "person.fill",
                        title: "\(HomeState.Constants.name)\(viewModel.state.oAuth?.name ?? "")",
                        loading: viewModel.state.isLoading
                    )
                    UserInfoRow(
                        icon: "person.circle",
                        title: "\(HomeState.Constants.username)\(viewModel.state.oAuth?.user ?? "")",
                        loading: viewModel.state.isLoading
                    )
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color(.systemGray6))
                .cornerRadius(12)
                .padding(.horizontal)
                Spacer()
                VStack(spacing: 16) {
                    NavigationLink {
                        TablesView<TablesViewModel>()
                    } label: {
                        NavigationButton(
                            icon: "tablecells",
                            title: HomeState.Constants.schemes,
                            loading: viewModel.state.isLoading
                        )
                    }
                    NavigationLink {
                        LocalitiesView<LocalitiesViewModel>()
                    } label: {
                        NavigationButton(
                            icon: "mappin.and.ellipse",
                            title: HomeState.Constants.localities,
                            loading: viewModel.state.isLoading
                        )
                    }
                }
                .padding(.horizontal)
                Spacer()
            }
            .navigationTitle(HomeState.Constants.title)
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear {
            viewModel.onAppear()
        }
        .onDisappear {
            viewModel.onDisAppear()
        }
        .alert(isPresented: $viewModel.state.alert) {
            Alert(
                title: Text(HomeState.Constants.error),
                message: Text(HomeState.Constants.error),
                dismissButton: .cancel(Text(HomeState.Constants.accept)))
        }
        .alert(isPresented: $viewModel.state.alertUpdateVersion) {
            Alert(
                title: Text(HomeState.Constants.versionUpdate),
                message: Text(viewModel.state.versionUpdateMessage),
                dismissButton: .cancel(Text(HomeState.Constants.accept)))
        }
    }
}

