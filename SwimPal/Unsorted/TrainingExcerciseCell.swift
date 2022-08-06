//
//  TrainingExcerciseCell.swift
//  SwimPal
//
//  Created by Bruno Benčević on 30.06.2022..
//

import SwiftUI

struct TrainingExcerciseCell: View {
    
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
    }
    
    var isMinor: Bool {
        excercise.style == .stretching || excercise.style == .rest
    }
    
    var height: CGFloat {
        (isMinor ? 30 : 60) * (excercise.isInProgress ? 1 : 0.8)
    }
}

private extension TrainingExcerciseCell {
    
    @ViewBuilder
    var timeLimit: some View {
        if let limit = excercise.timeLimit {
            HStack(spacing: 0) {
                Image("icon_time")
                    .resizable()
                    .frameForIcon()
                    .padding(.leading, 4)
                
                Text(verbatim: limit.getFormatted(.minutes))
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
                    .padding(.horizontal, 8)
            }
        }
    }
}

struct TrainingExcerciseCell_Previews: PreviewProvider {
    static var previews: some View {
        TrainingExcerciseCell(excercise: .init(style: .stretching, value: 5, numberOfRepetitions: 3))
        
        TrainingExcerciseCell(excercise: .init(style: .stretching, value: 5))
        
        TrainingExcerciseCell(excercise: .init(style: .stretching, value: 5, numberOfRepetitions: 3, timeLimit: Time(5, .minutes)))
    }
}
