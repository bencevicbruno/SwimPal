//
//  TrainingsViewModel.swift
//  SwimPal
//
//  Created by Bruno Benčević on 02.06.2022..
//

import SwiftUI
import Combine

final class TrainingsViewModel: ObservableObject {
    
    @Published var trainings: [Training] = []
    @Published var headerData: TrainingHeaderData = .empty
    @Published var error: Error?
    @Published var isActivityRunning = false
    @Published var trainingSelectionData: TrainingSelectionData?
    @Published var optionsData: OptionsData?
    @Published var confirmationData: ConfirmationData?
    
    var onGoToStartTraining: ((Training.Category) -> Void)?
    var onGoToTrainingSummary: ((UUID) -> Void)?
    
    @Dependency private var persistenceService: PersistenceServiceProtocol
    @Dependency private var trainingsService: TrainingsServiceProtocol
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        $trainings.sink { [weak self] _ in
            self?.updateTotals()
        }
        .store(in: &cancellables)
        
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTrainings), name: .reloadTrainings, object: nil)
        
        reloadTrainings()
    }
    
    func saveTraining(_ training: Training) {
        self.trainings.append(training)
    }
    
    // MARK: - User Interactions
    
    func startTrainingTapped() {
        trainingSelectionData = TrainingSelectionData { [weak self] category in
            self?.onGoToStartTraining?(category)
        }
    }
    
    func trainingCellTapped(trainingID: UUID) {
        onGoToTrainingSummary?(trainingID)
    }
    
    func trainingCellOptionsTapped(trainingID: UUID) {
        optionsData = .init(title: "Watcha wanna do?", items: [
            .init(iconName: "icon_bin", title: "Delete Training"),
            .init(iconName: "icon_share", title: "Share Training")
        ]) { [weak self] option in
            switch option {
            case 0:
                self?.showDeleteTrainingConfirmation(trainingID: trainingID)
            case 1:
                self?.showShareTrainingModal()
            default:
                break;
            }
        }
    }
}

private extension TrainingsViewModel {
    
    @objc func reloadTrainings() {
        error = nil
        isActivityRunning = true
        
        trainingsService.fetchTrainings { [weak self] result in
            guard let self = self else { return }
            self.isActivityRunning = false
            
            switch result {
            case .success(let trainings):
                self.trainings = trainings
                self.updateTotals()
                self.objectWillChange.send()
            case .failure(let error):
                self.error = error
            }
        }
    }
    
    func showDeleteTrainingConfirmation(trainingID: UUID) {
        confirmationData = .init(title: "Delete?", message: "Can not be undone") { [weak self] in
            guard let self = self else { return }
            self.isActivityRunning = true
            
            self.trainingsService.deleteTraining(withID: trainingID) { [weak self] result in
                guard let self = self else { return }
                
                switch result {
                case .success:
                    self.reloadTrainings()
                case .failure(let error):
                    debugError("Unable to delete training", error)
                }
            }
        }
    }
    
    func showShareTrainingModal() {
        
    }
    
    func updateTotals() {
        var distance: Distance = .zero
        var time: Time = .zero
        var speed: Speed = .zero
        
        trainings.forEach { training in
            distance += training.totalDistance
            time += training.time
            speed = max(speed, training.averageSpeed)
        }
        
        let favoriteCategory = trainings.map { $0.category }.frequencyOfUniqueElements.sorted(by: { $0.value > $1.value }).first?.key
        
        self.headerData = .init(totalDistance: distance, totalTime: time, maxSpeed: speed, favoriteCategory: favoriteCategory)
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
        viewModel.error = TrainingsServiceError.failedToEditTraining
        
        return viewModel
    }
}
