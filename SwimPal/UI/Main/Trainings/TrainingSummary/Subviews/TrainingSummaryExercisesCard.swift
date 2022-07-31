//
//  TrainingSummaryExercises.swift
//  SwimPal
//
//  Created by Bruno Benčević on 29.07.2022..
//

import SwiftUI

struct TrainingSummaryExercisesCard: View {
    
    private let training: Training
    
    init(_ training: Training) {
        self.training = training
    }
    
    var body: some View {
        TrainingSummaryCardBase("Exercises", iconName: "waveform.path.ecg") {
            ForEach(training.excercises) {
                TrainingSummaryExerciseCell(excercise: $0)
            }
        }
    }
}

struct TrainingSummaryExercises_Previews: PreviewProvider {
    static var previews: some View {
        TrainingSummaryExercisesCard(.random)
            .addShadow()
            .padding()
    }
}
