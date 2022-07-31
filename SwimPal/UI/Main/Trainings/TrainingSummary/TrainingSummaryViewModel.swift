//
//  TrainingSummaryViewModel.swift
//  SwimPal
//
//  Created by Bruno Benčević on 28.06.2022..
//

import Foundation

final class TrainingSummaryViewModel: ObservableObject {
    
    var onDismissed: EmptyCallback?
    var onGoToEditTraining: EmptyCallback?
    
    let training: Training
    
    init(training: Training) {
        self.training = training
    }
}

// MARK: - User Interactions
extension TrainingSummaryViewModel {
    
    func dismiss() {
        onDismissed?()
    }
    
    func editTrainingTapped() {
        onGoToEditTraining?()
    }
}
