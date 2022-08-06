//
//  TrainingCell.swift
//  SwimPal
//
//  Created by Bruno Benčević on 22.06.2022..
//

import SwiftUI

struct TrainingCell: View {
    
    let training: Training
    let onTapped: UUIDCallback?
    let onOptionsTapped: UUIDCallback?
    
    init(_ training: Training, onTapped: UUIDCallback? = nil, onOptionsTapped: UUIDCallback? = nil) {
        self.training = training
        self.onTapped = onTapped
        self.onOptionsTapped = onOptionsTapped
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            categoryIcon
                .padding([.top, .leading], 10)
            
            VStack(alignment: .leading) {
                Text(training.date.formatted(as: "MM/dd/yyyy"))
                    .style(.roboto(.smallCaption, .medium), .gray142)
                
                Spacer(minLength: 0)
                
                Text(training.name)
                    .lineLimit(1)
                    .style(.roboto(.body, .bold), .black, .leading)
                
                Spacer(minLength: 0)
                
                timeLabel
            }
            .padding(.top, 10)
            
            Spacer(minLength: 10)
            
            optionsIcon
        }
        .padding(.bottom, 10)
        .frame(maxWidth: .infinity)
        .frame(height: 80)
        .background(Color.white)
        .clipShape(.roundedRectangle(10))
        .onTapGesture {
            onTapped?(training.id)
        }
    }
}

private extension TrainingCell {
    
    var categoryIcon: some View {
        Image(training.category.imageName)
            .resizable()
            .scaledToFill()
            .frame(65)
            .clipShape(.roundedRectangle(10))
            .frame(70)
    }
    
    var timeLabel: some View {
        HStack(spacing: 5) {
            Image("icon_time_gray")
                .resizable()
                .scaledToFit()
                .frame(18)
                .frame(20)
                .foregroundColor(.gray142)
            
            Text(training.time.getFormatted(with: .hoursMinutesSeconds))
                .style(.roboto(.caption, .medium), .gray142, .leading)
        }
    }
    
    var optionsIcon: some View {
        Image("icon_options")
            .frameForIcon()
            .contentShape(Rectangle())
            .onTapGesture {
                onOptionsTapped?(training.id)
            }
    }
}

struct TrainingCell_Previews: PreviewProvider {
    static var previews: some View {
        TrainingCell(.init(name: "4x Everything", time: Time(1000, .seconds).and(4, .hours), location: .init(name: "Gradski bazeni"), category: .randomCase, exercises: Training.Category.lifeguard.excercises), onTapped: nil)
            .addShadow(.small)
            .padding()
    }
}
