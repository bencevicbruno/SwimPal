//
//  TrainingPerparationViewModel.swift
//  SwimPal
//
//  Created by Bruno Benčević on 28.06.2022..
//

import Foundation

final class TrainingPreparationViewModel: ObservableObject {
    
    var onDismissed: EmptyCallback?
    var onGoToAddExercise: ((@escaping (Training.Excercise) -> Void) -> Void)?
    var onGoToActiveTraining: ((ActiveTraining) -> Void)?
    
    let category: Training.Category
    @Published var excercises: [Training.Excercise]
    
    init(category: Training.Category) {
        self.category = category
        
        self.excercises = category.excercises
    }
    
    func dismiss() {
        onDismissed?()
    }
    
    func startTraining() {
        excercises.insert(Training.Excercise(style: .stretching, value: 5, numberOfRepetitions: 1, timeLimit: nil, isInProgress: false), at: 0)
        excercises.append(Training.Excercise(style: .stretching, value: 5, numberOfRepetitions: 1, timeLimit: nil, isInProgress: false))
        onGoToActiveTraining?(ActiveTraining(category: category, excercises: excercises))
    }
    
    func goToAddExercise() {
        self.onGoToAddExercise? { [weak self] exercise in
            self?.excercises.append(exercise)
        }
    }
}
