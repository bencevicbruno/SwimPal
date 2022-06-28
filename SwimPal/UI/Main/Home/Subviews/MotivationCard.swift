//
//  MotivationCard.swift
//  SwimPal
//
//  Created by Bruno Benčević on 22.06.2022..
//

import SwiftUI

struct MotivationCard: View {
    
    let motivation: Motivation
    
    var body: some View {
        ZStack(alignment: .bottom) {
            image
            
            LinearGradient(colors: [.clear, .black.opacity(0.15), .black.opacity(0.2)], startPoint: .top, endPoint: .bottom)
                .frame(height: 100)
            
            HStack(spacing: 0) {
                VStack(alignment: .leading, spacing: 0) {
                    Text("\"" + motivation.motivation + "\"")
                        .style(.roboto(.caption, .medium, italic: true), .white, .leading)
                        .padding(5, .standard)
                    
                    Text("- " + motivation.quotee)
                        .style(.roboto(.caption), .white, .leading)
                        .padding(.leading, 20)
                }
                .padding(.bottom, 5)
                
                Spacer(minLength: 5)
            }
        }
        .background(background)
        .aspectRatio(16.0 / 9.0, contentMode: .fit)
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

private extension MotivationCard {
    
    @ViewBuilder
    var image: some View {
        if let placeholder = motivation.placeholderName {
            Image(placeholder)
                .resizable()
                .scaledToFit()
        } else {
            Color.blue
        }
    }
    
    @ViewBuilder
    var background: some View {
        if let placeholder = motivation.placeholderName {
            Image(placeholder)
                .resizable()
                .scaledToFill()
                .blur(radius: 10)
        } else {
            Color.blue
        }
    }
}

struct MotivationCard_Previews: PreviewProvider {
    static var previews: some View {
        MotivationCard(motivation: .sampleKarlo)
    }
}
