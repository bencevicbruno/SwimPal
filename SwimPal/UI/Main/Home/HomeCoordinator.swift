//
//  HomeCoordinator.swift
//  SwimPal
//
//  Created by Bruno Benčević on 30.05.2022..
//

import SwiftUI

final class HomeCoordinator: ObservableObject {
    
    @Published var viewModel = HomeViewModel()
    
    init() {
        
    }
}

struct HomeCoordinatorView: View {
    
    @ObservedObject var coordinator: HomeCoordinator
    
    var body: some View {
        HomeView(coordinator.viewModel)
    }
    
    init(_ coordinator: HomeCoordinator) {
        self.coordinator = coordinator
    }
}
