//
//  TrainingSummaryCoordinator.swift
//  SwimPal
//
//  Created by Bruno Benčević on 11.07.2022..
//

import SwiftUI

class TrainingSummaryCoordinator: ObservableObject {
    
    var onDismissed: EmptyCallback?
    
    @Published var viewModel: TrainingSummaryViewModel
    @Published var editTrainingViewModel: EditTrainingViewModel?
    @Published var locationPickerCoordinator: LocationPickerCoordinator?
    
    init(training: Training) {
        viewModel = TrainingSummaryViewModel(training: training)
        
        viewModel.onDismissed = { [weak self] in
            self?.dismiss()
        }
        
        viewModel.onGoToEditTraining = { [weak self] in
            self?.goToEditTraining()
        }
    }
    
    func goToEditTraining() {
        editTrainingViewModel = EditTrainingViewModel()
        
        editTrainingViewModel!.onDismissed = { [weak self] in
            self?.editTrainingViewModel = nil
        }
        
        editTrainingViewModel?.onGoToLocationPicker = { [weak self] in
            self?.goToLocationPicker()
        }
    }
    
    func goToLocationPicker() {
        locationPickerCoordinator = LocationPickerCoordinator()
        
        locationPickerCoordinator!.onDismissed = { [weak self] pickedLocation in
            self?.editTrainingViewModel?.location = pickedLocation
            self?.locationPickerCoordinator = nil
        }
    }
    
    func dismiss() {
        onDismissed?()
    }
}

struct TrainingSummaryCoordinatorView: View {
    
    @ObservedObject var coordinator: TrainingSummaryCoordinator
    
    var body: some View {
        TrainingSummaryView(viewModel: coordinator.viewModel)
            .pushNavigation(item: $coordinator.editTrainingViewModel) {
                EditTrainingView(viewModel: $0)
                    .pushNavigation(item: $coordinator.locationPickerCoordinator) {
                        LocationPickerCoordinatorView(coordinator: $0)
                    }
            }
            
    }
}


