//
//  OnboardingStep.swift
//  SwimPal
//
//  Created by Bruno Benčević on 04.08.2022..
//

import SwiftUI

struct OnboardingStep: View {
    
    private let item: OnboardingItem
    
    init(_ item: OnboardingItem) {
        self.item = item
    }
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer(minLength: 10)
            
            Image(item.illustrationName)
                .resizable()
                .scaledToFit()
                .padding(.horizontal, 10)
            
            Spacer(minLength: 10)
            
            Text(verbatim: item.title)
                .style(.roboto(.headline1, .bold), .brand, .center)
                .padding(.bottom, 10)
            
            Text(verbatim: item.message)
                .style(.roboto(.body), .black, .center)
            
            Spacer(minLength: 10)
        }
    }
}

struct OnboardingStep_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingStep(.init(id: 0,
                             title: Localizable.onboarding_step_1_title,
                             message: Localizable.onboarding_step_1_message,
                             illustrationName: "illustration_error"))
    }
}
