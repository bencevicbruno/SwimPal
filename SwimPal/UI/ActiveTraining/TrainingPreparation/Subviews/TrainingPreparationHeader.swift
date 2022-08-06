//
//  TrainingPreparationHeader.swift
//  SwimPal
//
//  Created by Bruno Benčević on 13.07.2022..
//

import SwiftUI

struct TrainingPreparationHeader: View {
    
    let category: Training.Category
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 10) {
                Image(category.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(UIScreen.width / 5)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Text(verbatim: category.title)
                    .style(.roboto(.display1, .black), .brand, .leading)
                
                Spacer(minLength: 10)
            }
            .padding([.leading, .top], 10)
            
            Capsule()
                .fill(.gray)
                .frame(height: 1)
                .padding(.horizontal, 10)
            
            HStack(spacing: 0) {
                Text(verbatim: category.description)
                    .style(.roboto(.body, .medium), .brand, .leading)
                    .frame(idealHeight: 100)
                
                Spacer(minLength: 0)
            }
            .padding([.horizontal, .bottom], 10)
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

struct TrainingPreparationHeader_Previews: PreviewProvider {
    static var previews: some View {
        TrainingPreparationHeader(category: .lifeguard)
            .addShadow(.small)
            .padding()
    }
}
