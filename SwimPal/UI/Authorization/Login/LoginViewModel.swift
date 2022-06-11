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
    
    init() {
        
    }
    
    // MARK: - User Interactions
    
    func loginTapped() {
        onGoToMain?()
    }
    
    func registerTapped() {
        onGoToRegister?()
    }
}
