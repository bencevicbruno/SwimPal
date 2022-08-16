//
//  GeneralView.swift
//  SwimPal
//
//  Created by Bruno Benčević on 02.06.2022..
//

import SwiftUI

struct GeneralView: View {
    
    @ObservedObject var viewModel: GeneralViewModel
    @ObservedObject var refreshToken = RefreshToken.instance
    
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView(.vertical) {
                content
                    .padding([.top, .horizontal], 10)
                    .padding(.bottom, MainTabBar.height)
            }
            .padding(.top, MainTitle.totalHeight)
            
            MainTitle(Localizable.title_about)
        }
        .setupView()
        .confirmationSheet($viewModel.confirmationData)
        .refreshable(using: refreshToken)
    }
    
    init(_ viewModel: GeneralViewModel) {
        self.viewModel = viewModel
    }
}

private extension GeneralView {
    
    var content: some View {
        LazyVStack(spacing: 15) {
            if let userData = viewModel.userData {
                ProfileDetailsCard(userData: userData)
                    .addShadow(.small)
            }
            
            SPActionButton(Localizable.title_statistics, iconName: "icon_statistics_white") {
                viewModel.goToStatistics()
            }
            .addShadow(.small)
            
            SPActionButton(Localizable.title_achievements, iconName: "icon_achievements_white") {
                viewModel.goToAchievements()
            }
            .addShadow(.small)
            
            SPActionButton(Localizable.title_settings, iconName: "icon_settings_white") {
                viewModel.goToSettings()
            }
            .addShadow(.small)
            
            createSection(Localizable.other)
            
            SPActionButton(Localizable.title_onboarding, iconName: "icon_onboarding_white") {
                viewModel.onboardingTapped()
            }
            .addShadow(.small)
            
            SPActionButton(Localizable.title_about, iconName: "icon_about_white") {
                viewModel.goToAbout()
            }
            .addShadow(.small)
            
            SPActionButton(Localizable.log_out, iconName: "icon_logout_white") {
                viewModel.logOut()
            }
            .addShadow(.small)
            
            Spacer()
        }
    }
    
    func createSection(_ title: String) -> some View {
        HStack {
            Capsule()
                .fill(Color.gray142)
                .frame(width: 15, height: 5)
            
            Text(verbatim: title)
                .style(.roboto(.body, .bold), .gray142)
            
            Capsule()
                .fill(Color.gray142)
                .frame(height: 5)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        GeneralView(.init())
    }
}
