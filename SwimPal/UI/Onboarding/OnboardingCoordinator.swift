//
//  OnboardingCoordinator.swift
//  SwimPal
//
//  Created by Bruno Benčević on 24.05.2022..
//

import SwiftUI

final class OnboardingCoordinator: ObservableObject {
    
    var onGoToAuthorization: EmptyCallback?
    
    init() {
        
    }
    
    func goToAuthorization() {
        onGoToAuthorization?()
    }
}

struct OnboardingCoordinatorView: View {
    
    @ObservedObject var coordinator: OnboardingCoordinator
    
    var body: some View {
        Button("Go to login") {
            coordinator.goToAuthorization()
        }
    }
    
    init(_ coordinator: OnboardingCoordinator) {
        self.coordinator = coordinator
    }
}
