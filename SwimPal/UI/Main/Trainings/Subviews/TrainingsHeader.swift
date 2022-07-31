//
//  TrainingsHeader.swift
//  SwimPal
//
//  Created by Bruno Benčević on 22.07.2022..
//

import SwiftUI

struct TrainingsHeader: View {
    
    let totalDistance: Distance
    let totalTime: Time
    let maxSpeed: Speed
    let favoriteCategory: Training.Category
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            HStack(alignment: .top, spacing: 0) {
                column("Distance", value: Distance.Unit.kilometers.format(amount: totalDistance.meters))
                
                column("Time", value: totalTime.getFormatted(with: .hoursMinutes))
                
                column("Max Speed", value: maxSpeed.format(in: .metersPerSecond))
            }
            
            separator
            
            favoriteTrainingCategoryCell
        }
        .padding(15)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .clipShape(.roundedRectangle(15))
    }
}

private extension TrainingsHeader {
    
    func column(_ title: String, value: String) -> some View {
        HStack(spacing: 0) {
            VStack(alignment: .leading) {
                Text(title)
                    .style(.roboto(.body, .medium), .gray142, .leading)
                
                Text(value)
                    .style(.roboto(.headline2, .bold), .black, .leading)
            }
            
            Spacer(minLength: 0)
        }
        .frame(maxWidth: .infinity)
    }
    
    var separator: some View {
        Rectangle()
            .fill(Color.gray142)
            .frame(height: 1)
            .frame(maxWidth: .infinity)
    }
    
    var favoriteTrainingCategoryCell: some View {
        HStack(spacing: 10) {
            Image(favoriteCategory.imageName)
                .resizable()
                .scaledToFill()
                .frame(50)
                .background(Color.white)
                .clipShape(.roundedRectangle(10))
            
            VStack(alignment: .leading) {
                Text("Favorite Training")
                    .style(.roboto(.body, .medium), .gray142)
                
                Spacer(minLength: 0)
                
                Text(favoriteCategory.title)
                    .style(.roboto(.headline2, .bold), .black, .leading)
            }
            .frame(height: 50)
        }
    }
}

struct TrainingsHeader_Previews: PreviewProvider {
    static var previews: some View {
        TrainingsHeader(totalDistance: .init(5, .meters), totalTime: .init(5, .hours), maxSpeed: .init(5, .metersPerSecond), favoriteCategory: .lifeguard)
            .addShadow()
            .padding()
    }
}
