//
//  ProfileViewModel.swift
//  SwimPal
//
//  Created by Bruno Benčević on 02.06.2022..
//

import Combine
import SwiftUI

final class GeneralViewModel: ObservableObject {
    
    var onGoToStatistics: EmptyCallback?
    var onGoToAchievements: EmptyCallback?
    var onGoToSettings: EmptyCallback?
    var onGoToOnboarding: EmptyCallback?
    var onGoToAbout: EmptyCallback?
    var onLoggedOut: EmptyCallback?
    
    @Published var confirmationData: ConfirmationData?
    @Published var confirmationDialog: ConfirmationDialog?
    
    @Service var persistenceService: PersistenceServiceProtocol
    
    init() {
        
    }
    
    var userData: UserData? {
        persistenceService.user
    }
    
    // MARK: - User Interactions
    
    func goToStatistics() {
        onGoToStatistics?()
    }
    
    func goToAchievements() {
        onGoToAchievements?()
    }
    
    func goToSettings() {
        onGoToSettings?()
    }
    
    func goToAbout() {
        onGoToAbout?()
    }
    
    func onboardingTapped() {
        onGoToOnboarding?()
    }
    
    func logOut() {
//        confirmationData = .init(title: Localizable.confirmation_log_out_title, message: Localizable.confirmation_log_out_message, cancelTitle: Localizable.cancel, confirmTitle: Localizable.log_out, action: { [weak self] in
//            self?.onLoggedOut?()
//            self?.persistenceService.user = nil
//        })
        
        confirmationDialog = .init(
            title: Localizable.confirmation_log_out_title,
            message: Localizable.confirmation_log_out_message,
            confirmTitle: Localizable.log_out,
            declineTitle: Localizable.cancel,
        confirmAction: { [weak self] in
            guard let self = self else { return }
            self.onLoggedOut?()
            self.persistenceService.user = nil
        })
    }
}
