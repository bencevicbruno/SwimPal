//
//  TrainingSummaryCard.swift
//  SwimPal
//
//  Created by Bruno Benčević on 29.07.2022..
//

import SwiftUI

struct TrainingSummaryCardBase<Content: View>: View {
    
    let title: String
    let iconName: String
    @ViewBuilder let content: () -> Content
    
    init(_ title: String, iconName: String, @ViewBuilder content: @escaping () -> Content) {
        self.title = title
        self.iconName = iconName
        self.content = content
    }
    
    var body: some View {
        LazyVStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 10) {
                Image(systemName: iconName)
                    .resizable()
                    .scaledToFit()
                    .frame(30)
                    .foregroundColor(.brand)
                    .font(.bold(.headline)())
                
                Text(title)
                    .style(.roboto(.headline1, .bold), .brand)
            }
            
            content()
        }
        .padding(20)
        .background(Color.white)
        .clipShape(.roundedRectangle(15))
    }
}

struct TrainingSummaryCard_Previews: PreviewProvider {
    static var previews: some View {
        TrainingSummaryCardBase("Category", iconName: "signature") {
            Text("Hello, World!")
                .style(.roboto(.display1, .black), .brand, .center)
        }
        .addShadow()
        .padding()
    }
}
