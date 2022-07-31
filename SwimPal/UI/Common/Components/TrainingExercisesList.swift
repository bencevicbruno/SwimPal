//
//  TrainingExercisesList.swift
//  SwimPal
//
//  Created by Bruno Benčević on 29.07.2022..
//

import SwiftUI

struct TrainingExercisesList: View {
    
    private let exercises: [Training.Excercise]
    
    init(_ exercises: [Training.Excercise]) {
        self.exercises = exercises
    }
    
    var body: some View {
        LazyVStack(spacing: 2) {
            ForEach(exercises) {
                TrainingPreparationExerciseCell(excercise: $0)
                    .addShadow(.small)
                    .padding(.vertical, 5)
            }
        }
    }
}

struct TrainingExercisesList_Previews: PreviewProvider {
    static var previews: some View {
        TrainingExercisesList(Training.Category.lifeguard.excercises)
    }
}
