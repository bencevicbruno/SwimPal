//
//  TrainingSummaryLocationCard.swift
//  SwimPal
//
//  Created by Bruno Benčević on 29.07.2022..
//

import SwiftUI
import MapKit

struct TrainingSummaryLocationCard: View {
    
    private let location: Training.Location
    
    init(_ location: Training.Location) {
        self.location = location
    }
    
    var body: some View {
        TrainingSummaryCardBase(Localizable.location, iconName: "icon_location") {
            VStack(alignment: .leading, spacing: 10) {
                Text(location.name)
                    .style(.roboto(.headline2, .medium), .black, .leading)
                
                if let latitude = location.latitude,
                   let longitude = location.longitude {
                    Map(coordinateRegion: .constant(.init(center: .init(latitude: latitude, longitude: longitude), span: .init(latitudeDelta: 0.5, longitudeDelta: 0.5))))
                        .frame(maxWidth: .infinity)
                        .aspectRatio(1.0, contentMode: .fit)
                        .allowsHitTesting(false)
                        .clipShape(.roundedRectangle(15))
                        .overlay(Image("icon_location").frameForIcon())
                }
            }
        }
    }
}

struct TrainingSummaryLocationCard_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            TrainingSummaryLocationCard(.init(name: "Somewhere"))
                .addShadow()
                .padding()
            
            TrainingSummaryLocationCard(.init(latitude: 45, longitude: 45, name: "Somewhere"))
                .addShadow()
                .padding()
        }
    }
}
