//
//  TrainingsViewModel.swift
//  SwimPal
//
//  Created by Bruno Benčević on 02.06.2022..
//

import SwiftUI

final class TrainingsViewModel: ObservableObject {
    
    @Published var trainings: [Training] = []
    @Published var error: ErrorData?
    @Published var isActivityRunning = false
    @Published var trainingSelectionData: TrainingSelectionData?
    @Published var optionsData: OptionsData?
    @Published var confirmationData: ConfirmationData?
    
    var onGoToStartTraining: ((Training.Category) -> Void)?
    var onGoToTrainingSummary: ((Training) -> Void)?
    
    @Dependency private var databaseService: DatabaseServiceProtocol
    @Dependency private var persistenceService: PersistenceServiceProtocol
    
    init() {
//        loadTrainings()
    }
    
    // MARK: - User Interactions
    
    func trainingCellTapped(trainingID: UUID) {
        guard let training = trainings.first(where: { $0.id == trainingID }) else { return }
        onGoToTrainingSummary?(training)
    }
    
    func trainingCellOptionsTapped(trainingID: UUID) {
        optionsData = .init(title: "Watcha wanna do?", items: [
            .init(iconName: "icon_delete", title: "Delete Training"),
            .init(iconName: "icon_share", title: "Share Training")
        ]) { [weak self] option in
            switch option {
            case 0:
                self?.showDeleteTrainingConfirmation()
            case 1:
                self?.showShareTrainingModal()
            default:
                break;
            }
        }
    }
    
    func showTrainingOptions() {
        trainingSelectionData = TrainingSelectionData { [weak self] category in
            self?.onGoToStartTraining?(category)
        }
    }
}

private extension TrainingsViewModel {
    
    func loadTrainings() {
        guard let userID = persistenceService.user?.id else { return }
        error = nil
        isActivityRunning = true
        
        databaseService.fetchTrainings(userID: userID) { [weak self] result in
            guard let self = self else { return }
            self.isActivityRunning = false
            
            switch result {
            case .success(let trainings):
                self.trainings = trainings
            case .failure(let error):
                print(error)
                self.error = ErrorData(title: "Error loading trainings", message: "Error happened: \(error)", illustration: "illustration_error", retryTitle: "Try Again", onRetry: self.loadTrainings)
            }
        }
    }
    
    func showDeleteTrainingConfirmation() {
        confirmationData = .init(title: "Delete?", message: "Can not be undone")
    }
    
    func showShareTrainingModal() {
        
    }
}

// MARK: - Mock

extension TrainingsViewModel {
    
    static var mocked: TrainingsViewModel {
        let viewModel = TrainingsViewModel()
        viewModel.trainings = (1...10).map { .init(name: "Training #\($0)", time: .init(1, .hours), location: .init(latitude: 45, longitude: 45, name: "Nowhere"), category: .custom, exercises: Training.Category.everythingX4.excercises, notes: .loremIpsum) }
        
        return viewModel
    }
    
    static var mockedEmpty: TrainingsViewModel {
        let viewModel = TrainingsViewModel()
        return viewModel
    }
    
    static var mockedError: TrainingsViewModel {
        let viewModel = TrainingsViewModel()
        viewModel.error = ErrorData(title: "Error", message: .loremIpsumShort, illustration: "illustration_error")
        
        return viewModel
    }
}
