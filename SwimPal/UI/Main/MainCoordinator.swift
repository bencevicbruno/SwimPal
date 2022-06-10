//
//  MainCoordinator.swift
//  SwimPal
//
//  Created by Bruno Benčević on 24.05.2022..
//

import SwiftUI

enum MainTab {
    case home
    case trainings
    case profile
}

final class MainCoordinator: ObservableObject {
    
    @Published var homeCoordinator = HomeCoordinator()
    @Published var trainingCoordinator = TrainingsCoordinator()
    @Published var profileCoordinator = ProfileCoordinator()
    
    @Published var currentTab: MainTab = .home
    
    var onSignedOut: EmptyCallback?
    
    init() {
        
    }
}

struct MainCoordinatorView: View {
    
    @ObservedObject var coordinator: MainCoordinator
    
    var body: some View {
        NavigationView {
            TabView(selection: $coordinator.currentTab) {
                HomeCoordinatorView(coordinator.homeCoordinator)
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }
                    .tag(MainTab.home)
                
                TrainingsCoordinatorView(coordinator.trainingCoordinator)
                    .tabItem {
                        Image(systemName: "timer")
                        Text("Trainings")
                    }
                    .tag(MainTab.trainings)
                
                ProfileCoordinatorView(coordinator.profileCoordinator)
                    .tabItem {
                        Image(systemName: "person")
                        Text("Profile")
                    }
                    .tag(MainTab.profile)
            }
        }
        .navigationViewStyle(.stack)
    }
    
    init(_ coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
}
