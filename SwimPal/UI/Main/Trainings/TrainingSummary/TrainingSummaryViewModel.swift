//
//  TrainingSummaryViewModel.swift
//  SwimPal
//
//  Created by Bruno Benčević on 28.06.2022..
//

import Foundation

final class TrainingSummaryViewModel: ObservableObject {
    
    var onDismissed: EmptyCallback?
    var onGoToEditTraining: ((EditTrainingModel, ((EditTrainingModel) -> Void)?) -> Void)?
    
    @Published var training: Training
    @Published var refreshToken = RefreshToken()
    
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
        onGoToEditTraining?(EditTrainingModel(name: training.name, location: training.location, notes: training.notes)) { [weak self] model in
            guard let self = self else { return }
            
            self.training = self.training.withUpdatedInfo(name: model.name, location: model.location, notes: model.notes)
            self.refreshToken.refresh()
        }
    }
}
