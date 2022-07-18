//
//  ActiveTrainingCoordinator.swift
//  SwimPal
//
//  Created by Bruno Benčević on 28.06.2022..
//

import SwiftUI

final class ActiveTrainingCoordinator: ObservableObject {
    
    @Published var trainingPreparationViewModel: TrainingPreparationViewModel
    @Published var addExerciseViewModel: AddExerciseViewModel?
    @Published var activeTrainingViewModel: ActiveTrainingViewModel?
    @Published var saveTrainingViewModel: SaveTrainingViewModel?
    @Published var locationPickerCoordinator: LocationPickerCoordinator?
    
    var onDismissed: EmptyCallback?
    var onTrainingSaved: EmptyCallback?
    
    private let category: Training.Category
    
    init(category: Training.Category) {
        self.category = category
        trainingPreparationViewModel = TrainingPreparationViewModel(category: category)
        
        trainingPreparationViewModel.onDismissed = { [weak self] in
            self?.onDismissed?()
        }
        
        trainingPreparationViewModel.onGoToAddExercise = { [weak self] in
            self?.goToAddExercise()
        }
        
        trainingPreparationViewModel.onGoToActiveTraining = { [weak self] activeTraining in
            self?.goToActiveTraining(activeTraining)
        }
    }
    
    deinit {
        
    }
    
    func dismiss() {
        saveTrainingViewModel = nil
        activeTrainingViewModel = nil
        
        onDismissed?()
    }
    
    func goToAddExercise() {
        addExerciseViewModel = AddExerciseViewModel()
        
        addExerciseViewModel!.onDismissed = { [weak self] in
            self?.addExerciseViewModel = nil
        }
    }
    
    func goToActiveTraining(_ activeTraining: ActiveTraining) {
        activeTrainingViewModel = ActiveTrainingViewModel(activeTraining: activeTraining)
        
        activeTrainingViewModel!.onTrainingEnded = { [weak self] in
            self?.dismiss()
        }
        
        activeTrainingViewModel!.onGoToSaveTraining = { [weak self] activeTraining in
            self?.goToSaveTraining(activeTraining)
        }
    }
    
    func goToSaveTraining(_ activeTraining: ActiveTraining) {
        saveTrainingViewModel = SaveTrainingViewModel(activeTraining: activeTraining)
        
        saveTrainingViewModel!.onDismissed = { [weak self] in
            self?.dismiss()
        }
        
        saveTrainingViewModel!.onGoToLocationPicker = { [weak self] in
            self?.goToLocationPicker()
        }
        
        saveTrainingViewModel!.onTrainingSaved = { [weak self] in
            self?.onTrainingSaved?()
        }
    }
    
    func goToLocationPicker() {
        locationPickerCoordinator = LocationPickerCoordinator()
        
        locationPickerCoordinator!.onDismissed = { [weak self] newLocation in
            self?.locationPickerCoordinator = nil
            self?.saveTrainingViewModel?.location = newLocation
        }
    }
}

struct ActiveTrainingCoordinatorView: View {
    
    @ObservedObject var coordinator: ActiveTrainingCoordinator
    
    var body: some View {
        NavigationView {
            TrainingPreparationView(viewModel: coordinator.trainingPreparationViewModel)
                .presentNavigation(item: $coordinator.addExerciseViewModel) {
                    AddExerciseView(viewModel: $0)
                }
                .pushNavigation(item: $coordinator.activeTrainingViewModel) {
                    ActiveTrainingView(viewModel: $0)
                        .pushNavigation(item: $coordinator.saveTrainingViewModel) {
                        SaveTrainingView(viewModel: $0)
                                .pushNavigation(item: $coordinator.locationPickerCoordinator) {
                            LocationPickerCoordinatorView(coordinator: $0)
                        }
                    }
                }
        }
        .navigationViewStyle(.stack)
    }
}
