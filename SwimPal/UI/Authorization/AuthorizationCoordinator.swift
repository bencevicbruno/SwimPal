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
    @Published var registerViewModel: RegisterViewModel?
    
    init() {
        viewModel.onGoToMain = { [weak self] in
            self?.onGoToMain?()
        }
        
        viewModel.onGoToRegister = { [weak self] in
            self?.goToRegister()
        }
    }
    
    func goToRegister() {
        registerViewModel = RegisterViewModel()
        
        registerViewModel!.onDissmised = { [weak self] in
            self?.registerViewModel = nil
        }
        
        registerViewModel!.onGoToMain = { [weak self] in
            self?.goToMain()
        }
    }
    
    func goToMain() {
        registerViewModel = nil
        onGoToMain?()
    }
}

struct AuthorizationCoordinatorView: View {
    
    @ObservedObject var coordinator: AuthorizationCoordinator
    
    var body: some View {
        NavigationView {
            LoginView(viewModel: coordinator.viewModel)
                .pushNavigation(item: $coordinator.registerViewModel) { RegisterView(viewModel: $0) }
        }
    }
    
    init(_ coordinator: AuthorizationCoordinator) {
        self.coordinator = coordinator
    }
}
