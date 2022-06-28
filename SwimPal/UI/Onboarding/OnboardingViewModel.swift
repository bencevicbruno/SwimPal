//
//  OnboardingViewModel.swift
//  SwimPal
//
//  Created by Bruno Benčević on 24.06.2022..
//

import SwiftUI

struct OnboardingItem {
    let title: String
    let message: String
    let illustrationName: String
}

final class OnboardingViewModel: ObservableObject {
    
    var onGoToAuthorization: EmptyCallback?
    
    @Published var currentStep = 0
    
    init() {
        
    }
    
    let items: [OnboardingItem] = [
        .init(title: Localizable.onboarding_title_first,
              message: Localizable.onboarding_message_first,
              illustrationName: "illustration_error"),
        .init(title: Localizable.onboarding_title_second,
              message: Localizable.onboarding_message_second,
              illustrationName: "illustration_error"),
        .init(title: Localizable.onboarding_title_third,
              message: Localizable.onboarding_message_third,
              illustrationName: "illustration_error")
    ]
    
    var isLastStep: Bool {
        currentStep == items.count - 1
    }
    
    func goToAuthorization() {
        onGoToAuthorization?()
    }
}
