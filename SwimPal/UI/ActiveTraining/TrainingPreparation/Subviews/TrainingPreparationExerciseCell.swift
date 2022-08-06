//
//  TrainingPreparationExerciseCell.swift
//  SwimPal
//
//  Created by Bruno Benčević on 13.07.2022..
//

import SwiftUI

struct TrainingPreparationExerciseCell: View {
    
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
            isMinor ? Color.gray242 : Color.brand
        )
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    
    var isMinor: Bool {
        excercise.style == .stretching || excercise.style == .rest
    }
    
    var height: CGFloat {
        isMinor ? 40 : 60
    }
    
    var foregroundColor: Color {
        isMinor ? Color.brand : Color.gray242
    }
}

private extension TrainingPreparationExerciseCell {
    
    @ViewBuilder
    var timeLimit: some View {
        if let limit = excercise.timeLimit {
            HStack(spacing: 0) {
                Image("icon_time")
                    .resizable()
                    .frameForIcon()
                    .foregroundColor(foregroundColor)
                    .padding(.leading, 4)
                
                Text(verbatim: limit.getFormatted(.minutes))
                    .style(.roboto(.body, .medium), isMinor ? .brand : .white)
                    .padding(.leading, 4)
                    .padding(.trailing, 8)
                
                Rectangle()
                    .fill(.white)
                    .frame(width: 2)
                    .frame(maxHeight: .infinity)
            }
        } else {
            EmptyView()
        }
    }
    
    var whatPart: some View {
        HStack(spacing: 0) {
            Text("\(excercise.style.title) (\(excercise.value) \(excercise.style.unit))")
                .style(.roboto(.body, .medium), isMinor ? .brand : .white)
            
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
                    .frame(width: 2)
                    .frame(maxHeight: .infinity)
                
                Text("\(excercise.numberOfRepetitions)x")
                    .style(.roboto(.body, .medium), isMinor ? .brand : .white)
                    .padding(.horizontal, 8)
            }
        }
    }
}

struct TrainingPreparationExerciseCell_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            TrainingPreparationExerciseCell(excercise: .init(style: .butterfly, value: 5, numberOfRepetitions: 3))
            
            TrainingPreparationExerciseCell(excercise: .init(style: .stretching, value: 5))
            
            TrainingPreparationExerciseCell(excercise: .init(style: .stretching, value: 5, numberOfRepetitions: 3, timeLimit: Time(5, .minutes)))
        }
    }
}
