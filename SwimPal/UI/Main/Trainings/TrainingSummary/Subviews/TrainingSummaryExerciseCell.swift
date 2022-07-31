//
//  TrainingSummaryExerciseCell.swift
//  SwimPal
//
//  Created by Bruno Benčević on 29.07.2022..
//

import SwiftUI

struct TrainingSummaryExerciseCell: View {
    
    let excercise: Training.Excercise
    
    var body: some View {
        HStack(spacing: 0) {
            timeLimit
            
            whatPart
                .padding(.leading, 10)
            
            repetitionsPart
        }
        .frame(height: height)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(isMinor ? Color.gray142 : Color.brand)
        )
        .foregroundColor(Color.white)
    }
    
    var isMinor: Bool {
        excercise.style == .stretching || excercise.style == .rest
    }
    
    var height: CGFloat {
        (isMinor ? 40 : 60) * (excercise.isInProgress ? 1 : 0.8)
    }
}

private extension TrainingSummaryExerciseCell {
    
    @ViewBuilder
    var timeLimit: some View {
        if let limit = excercise.timeLimit {
            HStack(spacing: 0) {
                Image(systemName: "clock.badge.exclamationmark")
                    .resizable()
                    .frameForIcon()
                    .padding(.leading, 4)
                
                Text(verbatim: limit.getFormatted(.minutes))
                    .style(.roboto(.body), .white)
                    .padding(.leading, 4)
                    .padding(.trailing, 8)
                
                Rectangle()
                    .fill(.white)
                    .frame(width: 1)
                    .frame(maxHeight: .infinity)
            }
        } else {
            EmptyView()
        }
    }
    
    var whatPart: some View {
        HStack(spacing: 0) {
            Text("\(excercise.style.title) (\(excercise.value)\(excercise.style.unit))")
                .style(.roboto(.body, .medium), .white)
            
            Spacer(minLength: 10)
        }
    }
    
    @ViewBuilder
    var repetitionsPart: some View {
        if excercise.numberOfRepetitions == 1 {
            EmptyView()
        } else {
            HStack(spacing: 0) {
                Rectangle()
                    .fill(.white)
                    .frame(width: 1)
                    .frame(maxHeight: .infinity)
                
                Text("\(excercise.numberOfRepetitions)x")
                    .style(.roboto(.body), .white)
                    .padding(.horizontal, 8)
            }
        }
    }
}

struct TrainingSummaryExerciseCell_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            TrainingSummaryExerciseCell(excercise: .init(style: .stretching, value: 5, numberOfRepetitions: 3))
            
            TrainingSummaryExerciseCell(excercise: .init(style: .backStroke, value: 15))
            
            TrainingSummaryExerciseCell(excercise: .init(style: .stretching, value: 5, numberOfRepetitions: 3, timeLimit: Time(5, .minutes)))
        }
    }
}
