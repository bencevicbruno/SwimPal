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
        ScrollView {
            LazyVStack(alignment: .leading) {
                profileDetails
                    .padding(.vertical, 10)
                
                createSection("About you")
                
                createButton("Statistics", onTapped: viewModel.goToStatistics)
                
                createButton("Achievements", onTapped: viewModel.goToAchievements)
                
                createButton("Settings", onTapped: viewModel.goToSettings)
                
                createSection("Other")
                
                createButton("About", onTapped: viewModel.goToAbout)
                
                createButton("Log Out", onTapped: viewModel.logOut)
                
                Spacer()
            }
            .padding(10)
        }
        .removeNavigationBar()
        .background(.white)
        .confirmationSheet($viewModel.confirmationData)
    }
    
    init(_ viewModel: ProfileViewModel) {
        self.viewModel = viewModel
    }
}

private extension ProfileView {
    
    var avatar: some View {
        AsyncImage(url: viewModel.userData?.avatarURL) { image in
            image
                .resizable()
                .scaledToFill()
        } placeholder: {
            Image(systemName: "person")
                .resizable()
                .scaledToFit()
                .background(.blue)
        }
    }
    
    var profileDetails: some View {
        HStack(spacing: 0) {
            avatar
                .clipShape(Circle())
                .frame(UIScreen.width / 5)
                .padding(5, .standard)
            
            VStack(alignment: .leading, spacing: 0) {
                Text(verbatim: viewModel.userData?.name ?? Localizable.not_available_abbr)
                    .style(.roboto(.body, .bold), .black, .leading)
                    .padding(.bottom, 5)
                
                Text(verbatim: viewModel.userData?.email ?? Localizable.not_available_abbr)
                    .style(.roboto(.smallCaption, .light), .black, .leading)
            }
            
            Spacer(minLength: 10)
        }
        .padding(.vertical, 10)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.gray242)
        )
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
    
    func createButton(_ title: String, onTapped: EmptyCallback? = nil) -> some View {
        HStack {
            Text(verbatim: title)
                .style(.roboto(.headline2, .bold), .white)
            
            Spacer(minLength: 10)
            
            Image("icon_action")
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
                .frame(width: 40, height: 40)
        }
        .padding(.vertical, 8)
        .padding(.leading, 16)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.brand)
        )
        .onTapGesture {
            onTapped?()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(.init())
    }
}
