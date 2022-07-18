//
//  TrainingCard.swift
//  SwimPal
//
//  Created by Bruno Benčević on 22.06.2022..
//

import SwiftUI

struct TrainingCard: View {
    
    let category: Training.Category
    
    var body: some View {
        ZStack(alignment: .bottom) {
            LinearGradient(colors: [.black.opacity(0.5), .clear, .clear, .clear], startPoint: .bottom, endPoint: .top)
            
            HStack(spacing: 0) {
                Text(category.title)
                    .style(.roboto(.headline2, .bold), .white, .leading)
                
                Spacer(minLength: 0)
            }
            .padding(5)
        }
        .aspectRatio(0.75, contentMode: .fit)
        .background(
            Image(category.imageName)
                .resizable()
                .scaledToFill()
        )
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct TrainingCard_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(Training.Category.allCases) {
            TrainingCard(category: $0)
        }
    }
}
