//
//  ProfileDetailsCard.swift
//  SwimPal
//
//  Created by Bruno Benčević on 31.07.2022..
//

import SwiftUI

struct ProfileDetailsCard: View {
    
    let userData: UserData
    
    init(userData: UserData) {
        self.userData = userData
    }
    
    var body: some View {
        HStack(spacing: 0) {
            avatar
                .clipShape(Circle())
                .frame(UIScreen.width / 5)
                .padding(5, .standard)
            
            VStack(alignment: .leading, spacing: 0) {
                Text(verbatim: userData.name)
                    .style(.roboto(.body, .bold), .black, .leading)
                    .padding(.bottom, 5)
                
                Text(verbatim: userData.email)
                    .style(.roboto(.smallCaption, .light), .black, .leading)
            }
            
            Spacer(minLength: 10)
        }
        .padding(.vertical, 10)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
        )
        .clipped()
    }
}

private extension ProfileDetailsCard {
    
    @ViewBuilder
    var avatar: some View {
        if #available(iOS 15, *) {
            AsyncImage(url: userData.avatarURL) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                Image(systemName: "person")
                    .resizable()
                    .scaledToFill()
                    .background(Color.brand)
                    .foregroundColor(.white)
            }
        } else {
            Circle()
                .fill(Color.blue)
                .eraseToAnyView()
        }
    }
}

struct ProfileDetailsCard_Previews: PreviewProvider {
    static var previews: some View {
        ProfileDetailsCard(userData: .init(name: "Bruno", email: "test@brino.com"))
    }
}
