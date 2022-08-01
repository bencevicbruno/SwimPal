//
//  TrainingSummaryHeader.swift
//  SwimPal
//
//  Created by Bruno Benčević on 29.07.2022..
//

import SwiftUI

struct TrainingSummaryHeader: View {
    
    private let training: Training
    
    init(_ training: Training) {
        self.training = training
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(training.category.title)
                .style(.roboto(.caption, .medium), .gray, .leading)
                .padding(.bottom, 5)
            
            Text(verbatim: training.name)
                .style(.roboto(.headline1, .bold), .brand, .leading)
            
            separator
                .padding(.vertical, 10)
            
            HStack(spacing: 0) {
                label(iconName: "icon_time", value: training.time.getFormatted(with: .hoursMinutesSeconds))
                    .frame(maxWidth: .infinity)
                
                label(iconName: "icon_date", value: training.date.formatted(as: "MMM dd, YYYY"))
                    .frame(maxWidth: .infinity)
            }
            .frame(height: 30)
        }
        .padding(15)
        .clipped()
        .background(Color.white)
        .clipShape(.roundedRectangle(15))
    }
}

private extension TrainingSummaryHeader {
    
    var separator: some View {
        Rectangle()
            .fill(.black)
            .frame(maxWidth: .infinity, height: 1)
    }
    
    func label(iconName: String, value: String) -> some View {
        HStack(spacing: 5) {
            Image(iconName)
                .resizable()
                .scaledToFit()
                .frame(20)
            
            Text(value)
                .style(.roboto(.caption, .medium), .black, .leading)
            
            Spacer(minLength: 0)
        }
    }
}

struct TrainingSummaryHeader_Previews: PreviewProvider {
    static var previews: some View {
        TrainingSummaryHeader(.init(name: "This is a long name that its questionable if its gonna fit...", time: .init(90, .minutes), category: .lifeguard))
            .addShadow(.small)
            .padding()
    }
}
