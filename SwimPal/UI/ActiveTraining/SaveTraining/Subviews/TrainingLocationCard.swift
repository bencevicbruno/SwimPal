//
//  TrainingLocationCard.swift
//  SwimPal
//
//  Created by Bruno Benčević on 31.07.2022..
//

import SwiftUI
import MapKit

struct TrainingLocationCard: View {
    
    let location: Training.Location?
    let onAddLocationTapped: EmptyCallback?
    
    init(_ location: Training.Location? = nil, onAddLocationTapped: EmptyCallback? = nil) {
        self.location = location
        self.onAddLocationTapped = onAddLocationTapped
    }
    
    var body: some View {
        NamedContainer("Location", onEditTapped: location == nil ? nil : onAddLocationTapped) {
            if location != nil {
                mapView
            } else {
                Text("Add location")
                    .style(.roboto(.body, .bold), .brand, .center)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        onAddLocationTapped?()
                    }
            }
        }
    }
}

private extension TrainingLocationCard {
    
    var mapView: some View {
        VStack(spacing: 10) {
            HStack(spacing: 0) {
                Text(location?.name ?? "")
                    .style(.roboto(.body), .black, .leading)
                
                Spacer(minLength: 0)
            }
            
            if let latitude = location?.latitude,
               let longitude = location?.longitude {
                Map(coordinateRegion: .constant(.init(center: .init(latitude: latitude, longitude: longitude), span: .init())))
                    .aspectRatio(1.0, contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .padding(.bottom, 5)
            }
        }
        .padding(10)
    }
}

struct TrainingLocationCard_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView(.vertical) {
            LazyVStack {
                TrainingLocationCard()
                
                TrainingLocationCard(.init(name: "Somewhre"))
                
                TrainingLocationCard(.osijek)
            }
            .padding()
        }
        
    }
}
