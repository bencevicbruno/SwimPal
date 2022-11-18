//
//  LoginViewModel.swift
//  SwimPal
//
//  Created by Bruno Benčević on 10.06.2022..
//

import UIKit

final class LoginViewModel: ObservableObject {
    
    var onGoToMain: EmptyCallback?
    var onGoToRegister: EmptyCallback?
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var hidePassword = true
    @Published var infoData: InfoData?
    
    @Service private var authorizationService: AuthorizationServiceProtocol
    @Service private var persistenceService: PersistenceServiceProtocol
    
    init() {
        setupCallbacks()
    }
    
    // MARK: - User Interactions
    
    func loginTapped() {
        authorizationService.login { [weak self] userData in
            guard let self = self else { return }
            self.persistenceService.user = userData
            self.onGoToMain?()
            
        }
//        onGoToMain?()
    }
    
    
}

private extension LoginViewModel {
    
    func setupCallbacks() {
        authorizationService.onError = { [weak self] error in
            guard let self = self else { return }
            
            self.infoData = .init(title: "Error", message: error.localizedDescription)
        }
    }
}
