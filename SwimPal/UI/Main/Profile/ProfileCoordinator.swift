//
//  ProfileCoordinator.swift
//  SwimPal
//
//  Created by Bruno Benčević on 10.06.2022..
//

import SwiftUI

final class ProfileCoordinator: ObservableObject {
    
    @Published var viewModel = ProfileViewModel()
    
    init() {
        
    }
}

struct ProfileCoordinatorView: View {
    
    @ObservedObject var coordinator: ProfileCoordinator
    
    var body: some View {
        ProfileView(coordinator.viewModel)
    }
    
    init(_ coordinator: ProfileCoordinator) {
        self.coordinator = coordinator
    }
}
