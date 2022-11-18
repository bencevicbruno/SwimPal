//
//  TrainingSummaryViewModel.swift
//  SwimPal
//
//  Created by Bruno Benčević on 28.06.2022..
//

import Foundation

final class TrainingSummaryViewModel: ObservableObject {
    
    var onDismissed: EmptyCallback?
    var onGoToEditTraining: ((EditTrainingModel) -> Void)?
    
    private let trainingID: UUID
    
    @Published var training: Training?
    
    @Published var isActivityRunning = false
    
    @Service private var trainingsService: TrainingsServiceProtocol
    
    init(trainingID: UUID) {
        self.trainingID = trainingID
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTraining), name: .reloadTraining, object: nil)
        
        reloadTraining()
    }
}

// MARK: - User Interactions
extension TrainingSummaryViewModel {
    
    func dismiss() {
        onDismissed?()
    }
    
    func editTrainingTapped() {
        guard let training = training else { return }
        
        onGoToEditTraining?(EditTrainingModel(name: training.name, location: training.location, notes: training.notes))
    }
}

private extension TrainingSummaryViewModel {
    
    @objc func reloadTraining() {
        isActivityRunning = true
        
        trainingsService.fetchTraining(withID: trainingID) { [weak self] result in
            guard let self = self else { return }
            self.isActivityRunning = false
            
            switch result {
            case .success(let training):
                self.training = training
            case .failure(let error):
                debugError("Error loading training", error)
            }
        }
    }
}

extension TrainingSummaryViewModel {
    
    static func mocked(for training: Training) -> TrainingSummaryViewModel {
        let vm = TrainingSummaryViewModel(trainingID: UUID())
        vm.training = .sample
        
        return vm
    }
}
