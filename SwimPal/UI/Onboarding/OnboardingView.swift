//
//  OnboardingView.swift
//  SwimPal
//
//  Created by Bruno Benčević on 24.06.2022..
//

import SwiftUI

struct OnboardingView: View {
    
    @ObservedObject var viewModel: OnboardingViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            if viewModel.flow == .fromAbout {
                NavigationBar("Onboarding", onXTapped: viewModel.xTapped)
            }
            
            TabView(selection: $viewModel.currentStep) {
                ForEach(viewModel.items) {
                    OnboardingStep($0)
                        .padding(.horizontal, 10)
                        .tag($0.id)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .allowsHitTesting(false)
            
            nextButton
                .padding([.horizontal, .bottom], 10)
        }
        .setupView()
    }
}

private extension OnboardingView {
    
    var nextButton: some View {
        Text(viewModel.buttonTitle.uppercased())
            .style(.roboto(.display1, .bold), .white, .center)
            .padding(8)
            .frame(maxWidth: .infinity)
            .frame(height: 60)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.brand)
            )
            .contentShape(RoundedRectangle(cornerRadius: 10))
            .onTapGesture {
                viewModel.nextTapped()
            }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(viewModel: .init(.fromAbout))
        
        OnboardingView(viewModel: .init(.fromAppLaunch))
    }
}
