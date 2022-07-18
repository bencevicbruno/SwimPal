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
    var onGoToTrainingSummary: EmptyCallback?
    
    @Dependency private var databaseService: DatabaseServiceProtocol
    @Dependency private var persistenceService: PersistenceServiceProtocol
    
    init() {
//        loadTrainings()
        trainings = (1...10).map { .init(name: "Training #\($0)", date: .now, time: .init(1, .hours), location: .init(latitude: 0, longitude: 0, name: "Nowhere"), category: .custom, excercises: Training.Category.everythingX4.excercises) }
    }
    
    func showTrainingOptions() {
        trainingSelectionData = TrainingSelectionData { [weak self] category in
            self?.onGoToStartTraining?(category)
        }
    }
    
    func trainingTapped(index: Int) {
        onGoToTrainingSummary?()
    }
    
    func trainingOptionsTapped(index: Int) {
        optionsData = .init(title: "Watcha wanna do?", items: [
            .init(iconName: "icon_edit", title: "Delete Training"),
            .init(iconName: "icon_edit", title: "Share Training")
        ]) { [weak self] option in
            switch option {
            case 0:
                self?.showDeleteTrainingConfirmation()
            case 1:
                print("WIP")
            default:
                break;
            }
        }
    }
    
    private func showDeleteTrainingConfirmation() {
        confirmationData = .init(title: "Delete?", message: "Can not be undone")
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
}
