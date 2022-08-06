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
    
    private let trainingID: UUID
    
    init(trainingID: UUID) {
        self.trainingID = trainingID
        viewModel = TrainingSummaryViewModel(trainingID: trainingID)
        
        viewModel.onDismissed = { [weak self] in
            self?.dismiss()
        }
        
        viewModel.onGoToEditTraining = { [weak self] model in
            self?.goToEditTraining(model: model)
        }
    }
    
    func goToEditTraining(model: EditTrainingModel) {
        editTrainingViewModel = EditTrainingViewModel(trainingID: trainingID, model: model)
        
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
            if let pickedLocation = pickedLocation {
                self?.editTrainingViewModel?.location = pickedLocation
            }
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
            .push(item: $coordinator.editTrainingViewModel) {
                EditTrainingView(viewModel: $0)
                    .push(item: $coordinator.locationPickerCoordinator) {
                        LocationPickerCoordinatorView(coordinator: $0)
                    }
            }
            
    }
}


