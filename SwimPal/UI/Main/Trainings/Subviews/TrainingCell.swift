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
                .padding(.leading, 10)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(training.date.formatted(as: "MM/dd/yyyy"))
                    .style(.roboto(.smallCaption, .medium), .gray142)
                
                Text(training.name)
                    .lineLimit(1)
                    .style(.roboto(.body, .bold), .black, .leading)
                
                timeLabel
            }
            
            Spacer(minLength: 10)
            
            optionsIcon
                .padding(.trailing, 10)
        }
        .padding(.vertical, 10)
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
        Image("icon_mainTab_profile")
            .resizable()
            .scaledToFit()
            .frame(60)
            .clipShape(.roundedRectangle(10))
    }
    
    var timeLabel: some View {
        HStack(spacing: 10) {
            Image(systemName: "timer")
                .resizable()
                .scaledToFit()
                .frame(15)
                .foregroundColor(.gray142)
            
            Text(training.time.getFormatted(with: .hoursMinutesSeconds))
                .style(.roboto(.smallCaption, .medium), .gray142, .leading)
        }
    }
    
    var optionsIcon: some View {
        Text("...")
            .style(.roboto(.headline1, .black), .gray142)
            .frame(width: 40, height: 20)
            .frame(height: 40, alignment: .top)
            .contentShape(Rectangle())
            .onTapGesture {
                onOptionsTapped?(training.id)
            }
    }
}

struct TrainingCell_Previews: PreviewProvider {
    static var previews: some View {
        TrainingCell(.init(name: "4x Everything", time: Time(1000, .seconds).and(4, .hours), location: .init(name: "Gradski bazeni"), category: .random, exercises: Training.Category.lifeguard.excercises), onTapped: nil)
            .addShadow(.small)
            .padding()
    }
}
