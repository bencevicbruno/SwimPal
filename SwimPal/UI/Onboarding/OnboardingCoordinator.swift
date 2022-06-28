//
//  OnboardingCoordinator.swift
//  SwimPal
//
//  Created by Bruno Benčević on 24.05.2022..
//

import SwiftUI

final class OnboardingCoordinator: ObservableObject {
    
    var onGoToAuthorization: EmptyCallback?
    
    @Published var viewModel = OnboardingViewModel()
    
    @Dependency var persistenceService: PersistenceServiceProtocol
    
    init() {
        viewModel.onGoToAuthorization = { [weak self] in
            self?.goToAuthorization()
        }
    }
    
    func goToAuthorization() {
        persistenceService.didShowOnboarding = true
        onGoToAuthorization?()
    }
}

struct OnboardingCoordinatorView: View {
    
    @ObservedObject var coordinator: OnboardingCoordinator
    
    var body: some View {
        OnboardingView(viewModel: coordinator.viewModel)
    }
    
    init(_ coordinator: OnboardingCoordinator) {
        self.coordinator = coordinator
    }
}
