//
//  TrainingCell.swift
//  SwimPal
//
//  Created by Bruno Benčević on 22.06.2022..
//

import SwiftUI

struct TrainingCell: View {
    
    let training: Training
    let onTapped: EmptyCallback?
    
    var body: some View {
        HStack(spacing: 0) {
            VStack(spacing: 8) {
                HStack(spacing: 0) {
                    Text(verbatim: training.name)
                        .style(.roboto(.headline2, .bold), .white)
                        .padding(.trailing, 20)
                    
                    Text(verbatim: training.time.getFormatted(with: .hoursMinutes))
                        .style(.roboto(.body, .medium), .white)
                    
                    Spacer(minLength: 0)
                }
                
                HStack(spacing: 0) {
                    Image("icon_location")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .padding(.trailing, 8)
                    
                    Text(verbatim: training.location.name)
                        .style(.roboto(.body, .regular), .white)
                    
                    Spacer(minLength: 0)
                }
            }
            
            Image("icon_action")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .onTapGesture {
                    onTapped?()
                }
        }
        .padding(8)
        .frame(maxWidth: .infinity)
        .frame(height: 80)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.gray142)
        )
    }
}

struct TrainingCell_Previews: PreviewProvider {
    static var previews: some View {
        TrainingCell(training: .init(name: "4x Everything", date: .now, time: Time(1000, .seconds), location: .init(name: "Gradski bazeni"), category: .random, excercises: Training.Category.lifeguard.excercises), onTapped: nil)
    }
}
