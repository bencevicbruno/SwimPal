//
//  AboutSection.swift
//  SwimPal
//
//  Created by Bruno Benčević on 01.08.2022..
//

import SwiftUI

struct AboutSection: View {
    
    private let item: AboutItem
    
    init(_ item: AboutItem) {
        self.item = item
    }
    
    var body: some View {
        VStack(spacing: 10) {
            HStack(spacing: 0) {
                Text(item.title)
                    .foregroundColor(.brand)
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 20, weight: .bold))
                
                Spacer(minLength: 0)
            }
            
            HStack(spacing: 0) {
                if #available(iOS 15, *) {
                    Text(LocalizedStringKey(item.text))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                        .font(.system(.body))
                        .tint(Color.brand)
                } else {
                    Text(LocalizedStringKey(item.text))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                        .font(.system(.body))
                        .accentColor(Color.brand)
                }
                
                Spacer(minLength: 0)
            }
            .padding(.horizontal, 10)
            .background(Color.white)
            .padding(.leading, 3)
            .background(Color.brand)
            .padding(.leading, 5)
            
        }
        .padding(15)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

struct AboutSection_Previews: PreviewProvider {
    static var previews: some View {
        AboutSection(AboutItem(title: "About Test", text: .loremIpsum))
            .addShadow(.small)
            .padding()
    }
}
