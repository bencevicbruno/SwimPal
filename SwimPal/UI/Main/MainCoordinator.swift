//
//  MainCoordinator.swift
//  SwimPal
//
//  Created by Bruno Benčević on 24.05.2022..
//

import SwiftUI

final class MainCoordinator: ObservableObject {
    
    @Published var homeCoordinator = HomeCoordinator()
    @Published var trainingCoordinator = TrainingsCoordinator()
    @Published var profileCoordinator = ProfileCoordinator()
    
    @Published var currentTab: MainTab = .home
    @Published var isTabBarHidden = false
    
    var onGoToAuthorization: EmptyCallback?
    
    private init() {
        profileCoordinator.onGoToAuthorization = { [weak self] in
            self?.onGoToAuthorization?()
        }
    }
    
    private static var instance = MainCoordinator()
    
    static func getInstance(createNew: Bool = false) -> MainCoordinator {
        if createNew {
            let newInstance = MainCoordinator()
            Self.instance = newInstance
        }
        
        return Self.instance
    }
}

struct MainCoordinatorView: View {
    
    @ObservedObject var coordinator: MainCoordinator
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
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
                .tabViewStyle(.page(indexDisplayMode: .never))
                .removeNavigationBar()
                
                MainTabBar(currentTab: $coordinator.currentTab, isHidden: $coordinator.isTabBarHidden)
            }
            .edgesIgnoringSafeArea(.bottom)
        }
        .navigationViewStyle(.stack)
    }
    
    init(_ coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
}
