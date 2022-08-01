//
//  ProfileActionButton.swift
//  SwimPal
//
//  Created by Bruno Benčević on 31.07.2022..
//

import SwiftUI

struct SPActionButton: View {
    
    let title: String
    let iconName: String?
    let onTapped: EmptyCallback?
    
    init(_ title: String, iconName: String? = nil, _ onTapped: EmptyCallback? = nil) {
        self.title = title
        self.iconName = iconName
        self.onTapped = onTapped
    }
    
    var body: some View {
        HStack(spacing: 10) {
            if let iconName = iconName {
                Image(iconName)
                    .frameForIcon(size: 24)
            }
            
            Text(title)
                .style(.roboto(.headline2, .bold), .white)
                .padding(.leading, iconName == nil ? 10 : 0)
            
            Spacer(minLength: 0)
            
            if iconName == nil {
                Image("icon_action")
                    .frameForIcon()
            }
        }
        .padding(.vertical, 5)
        .frame(height: 50)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.brand)
        )
        .onTapGesture {
            onTapped?()
        }
    }
}

struct ProfileActionButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            SPActionButton("Action Button", iconName: "icon_logout_white")
            
            SPActionButton("Do something without icon")
        }
    }
}
