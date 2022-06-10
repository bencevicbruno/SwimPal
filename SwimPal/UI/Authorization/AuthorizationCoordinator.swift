//
//  AuthorizationCoordinator.swift
//  SwimPal
//
//  Created by Bruno Benčević on 24.05.2022..
//

import SwiftUI

final class AuthorizationCoordinator: ObservableObject {
    
    var onGoToMain: EmptyCallback?
    
    init() {
        
    }
    
    func goToMain() {
        onGoToMain?()
    }
}

struct AuthorizationCoordinatorView: View {
    
    @ObservedObject var coordinator: AuthorizationCoordinator
    
    var body: some View {
        Button("Go to main") {
            coordinator.goToMain()
        }
    }
    
    init(_ coordinator: AuthorizationCoordinator) {
        self.coordinator = coordinator
    }
}
