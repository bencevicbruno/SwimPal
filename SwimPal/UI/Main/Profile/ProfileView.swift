//
//  ProfileView.swift
//  SwimPal
//
//  Created by Bruno Benčević on 02.06.2022..
//

import SwiftUI

struct ProfileView: View {
    
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView(.vertical) {
                content
                    .padding(.horizontal, 10)
                    .padding(.bottom, MainTabBar.height)
            }
            .padding(.top, MainTitle.totalHeight)
            
            
            MainTitle("About you")
        }
        .setupView()
        .confirmationSheet($viewModel.confirmationData)
    }
    
    init(_ viewModel: ProfileViewModel) {
        self.viewModel = viewModel
    }
}

private extension ProfileView {
    
    var content: some View {
        LazyVStack(spacing: 15) {
            if let userData = viewModel.userData {
                ProfileDetailsCard(userData: userData)
                    .addShadow(.small)
            }
            
            SPActionButton("Statistics", iconName: "icon_statistics_white") {
                viewModel.goToStatistics()
            }
            .addShadow(.small)
            
            SPActionButton("Achievements", iconName: "icon_achievements_white") {
                viewModel.goToAchievements()
            }
            .addShadow(.small)
            
            createSection("Other")
            
            SPActionButton("Settings", iconName: "icon_settings_white") {
                viewModel.goToSettings()
            }
            .addShadow(.small)
            
            SPActionButton("About", iconName: "icon_about_white") {
                viewModel.goToAbout()
            }
            .addShadow(.small)
            
            SPActionButton("Log Out", iconName: "icon_logout_white") {
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
        ProfileView(.init())
    }
}
