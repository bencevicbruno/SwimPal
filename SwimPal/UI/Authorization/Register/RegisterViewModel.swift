//
//  RegisterViewModel.swift
//  SwimPal
//
//  Created by Bruno Benčević on 10.06.2022..
//

import UIKit

final class RegisterViewModel: ObservableObject {
    
    var onDissmised: EmptyCallback?
    var onGoToMain: EmptyCallback?
    
    @Published var email = ""
    @Published var password = ""
    @Published var passwordRepeated = ""
    @Published var hidePassword = true
    
    init() {
        print("init register vm")
    }
    
    deinit {
        print("deinit vm ")
    }
    
    // MARK: - User Interactions
    
    func dismiss() {
        onDissmised?()
    }
    
    func registerTapped() {
        onGoToMain?()
    }
}
