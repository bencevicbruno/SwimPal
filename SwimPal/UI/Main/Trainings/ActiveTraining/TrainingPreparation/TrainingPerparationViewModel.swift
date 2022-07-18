//
//  TrainingPerparationViewModel.swift
//  SwimPal
//
//  Created by Bruno Benčević on 28.06.2022..
//

import Foundation

final class TrainingPreparationViewModel: ObservableObject {
    
    var onDismissed: EmptyCallback?
    var onGoToAddExercise: EmptyCallback?
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
        onGoToActiveTraining?(ActiveTraining(category: category, excercises: excercises))
    }
    
    func goToAddExercise() {
        self.onGoToAddExercise?()
    }
}
