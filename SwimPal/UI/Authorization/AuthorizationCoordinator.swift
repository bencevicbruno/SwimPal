//
//  AuthorizationCoordinator.swift
//  SwimPal
//
//  Created by Bruno Benčević on 24.05.2022..
//

import SwiftUI

final class AuthorizationCoordinator: ObservableObject {
    
    var onGoToMain: EmptyCallback?
    
    @Published var viewModel = LoginViewModel()
    
    init() {
        viewModel.onGoToMain = { [weak self] in
            self?.onGoToMain?()
        }
    }
    
    func goToMain() {
        onGoToMain?()
    }
}

struct AuthorizationCoordinatorView: View {
    
    @ObservedObject var coordinator: AuthorizationCoordinator
    
    var body: some View {
        LoginView(viewModel: coordinator.viewModel)
            .removeNavigationBar()
    }
    
    init(_ coordinator: AuthorizationCoordinator) {
        self.coordinator = coordinator
    }
}
