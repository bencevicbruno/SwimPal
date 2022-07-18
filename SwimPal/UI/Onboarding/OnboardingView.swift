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
            TabView(selection: $viewModel.currentStep) {
                ForEach(0..<viewModel.items.count) { index in
                    stepView(viewModel.items[index])
                        .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            
            nextButton
                .padding(.bottom, 12)
        }
        .padding(.horizontal, 12)
        .background(.white)
    }
}

private extension OnboardingView {
    
    func stepView(_ item: OnboardingItem) -> some View {
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
    
    var nextButton: some View {
        Text(viewModel.isLastStep ? Localizable.start_swimming : Localizable.next)
            .style(.roboto(.display1, .bold), .white, .center)
            .padding(8)
            .frame(maxWidth: .infinity)
            .frame(height: 60)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.brand)
            )
            .onTapGesture {
                if viewModel.isLastStep {
                    viewModel.goToAuthorization()
                } else {
                    withAnimation(.linear(duration: 0.3)) {
                        viewModel.currentStep += 1
                    }
                }
            }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(viewModel: .init())
    }
}
