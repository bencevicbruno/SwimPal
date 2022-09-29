//
//  OnboardingViewModel.swift
//  SwimPal
//
//  Created by Bruno Benčević on 24.06.2022..
//

import SwiftUI
import Combine

enum OnboardingFlow {
    case fromAppLaunch
    case fromAbout
}

struct OnboardingItem: Identifiable {
    let id: Int
    let title: String
    let message: String
    let illustrationName: String
}

final class OnboardingViewModel: ObservableObject {
    
    var onDismissed: EmptyCallback?
    var onGoToAuthorization: EmptyCallback?
    
    @Published var currentStep = 0
    @Published private(set) var buttonTitle = Localizable.next
    
    let flow: OnboardingFlow
    
    init(_ flow: OnboardingFlow) {
        self.flow = flow
    }
    
    let items: [OnboardingItem] = [
        .init(id: 0,
              title: Localizable.onboarding_step_1_title,
              message: Localizable.onboarding_step_1_message,
              illustrationName: "illustration_error"),
        .init(id: 1,
              title: Localizable.onboarding_step_2_title,
              message: Localizable.onboarding_step_2_message,
              illustrationName: "illustration_error"),
        .init(id: 2,
              title: Localizable.onboarding_step_3_title,
              message: Localizable.onboarding_step_3_message,
              illustrationName: "illustration_error")
    ]
    
    var isLastStep: Bool {
        currentStep == items.count - 1
    }
}

//MARK: - User Interactions
extension OnboardingViewModel {
    
    func xTapped() {
        onDismissed?()
    }
    
    func nextTapped() {
        if currentStep + 1 == items.count - 1 {
            buttonTitle = Localizable.lets_go
        } else {
            buttonTitle = Localizable.next
        }
        
        if isLastStep {
            if flow == .fromAbout {
                onDismissed?()
            } else {
                onGoToAuthorization?()
            }
            
        } else {
            withAnimation(.easeInOut) {
                currentStep += 1
            }
        }
    }
}
