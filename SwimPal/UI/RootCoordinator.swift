//
//  RootCoordinator.swift
//  SwimPal
//
//  Created by Bruno Benčević on 24.05.2022..
//

import SwiftUI

final class RootCoordinator: ObservableObject {
    
    @Published var onboardingCoordinator: OnboardingCoordinator?
    @Published var authorizationCoordinator: AuthorizationCoordinator?
    @Published var mainCoordinator: MainCoordinator?
    
    @Dependency private var persistenceService: PersistenceServiceProtocol
    
    init() {
        if !persistenceService.didShowOnboarding {
            goToOnboarding()
            persistenceService.didShowOnboarding = true
        } else if persistenceService.user == nil {
            goToAuthorization()
        } else {
            goToMain()
        }
    }
    
    func goToOnboarding() {
        onboardingCoordinator = OnboardingCoordinator()
        authorizationCoordinator = nil
        mainCoordinator = nil
        
        onboardingCoordinator!.onGoToAuthorization = { [weak self] in
            self?.goToAuthorization()
        }
    }
    
    func goToAuthorization() {
        authorizationCoordinator = AuthorizationCoordinator()
        onboardingCoordinator = nil
        mainCoordinator = nil
        
        authorizationCoordinator!.onGoToMain = { [weak self] in
            self?.goToMain()
        }
    }
    
    func goToMain() {
        mainCoordinator = MainCoordinator.getInstance(createNew: true)
        onboardingCoordinator = nil
        authorizationCoordinator = nil
        
        mainCoordinator!.onGoToAuthorization = { [weak self] in
            self?.goToAuthorization()
        }
    }
}

struct RootCoordinatorView: View {
    
    @ObservedObject var coordinator: RootCoordinator
    
    var body: some View {
        if let coordinator = coordinator.onboardingCoordinator {
            OnboardingCoordinatorView(coordinator)
        } else if let coordinator = coordinator.authorizationCoordinator {
            AuthorizationCoordinatorView(coordinator)
        } else if let coordinator = coordinator.mainCoordinator {
            MainCoordinatorView(coordinator)
        } else {
            ErrorScreen(for: "\(self)")
        }
    }
}
