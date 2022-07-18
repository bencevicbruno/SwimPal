//
//  SaveTrainingViewModel.swift
//  SwimPal
//
//  Created by Bruno Benčević on 28.06.2022..
//

import Foundation

final class SaveTrainingViewModel: ObservableObject {
    
    var onDismissed: EmptyCallback?
    var onGoToLocationPicker: EmptyCallback?
    var onTrainingSaved: EmptyCallback?
    
    @Published var name = ""
    @Published var location: Training.Location?
    @Published var confirmationData: ConfirmationData?
    
    let activeTraining: ActiveTraining
    
    @Dependency var locationService: LocationService
    
    init(activeTraining: ActiveTraining) {
        self.activeTraining = activeTraining
    }
    
    func goToLocationPicker() {
        onGoToLocationPicker?()
    }
    
    func done() {
        onTrainingSaved?()
//        let training = Training(
//            name: name,
//            date: .now,
//            time: activeTraining.time ?? .zero,
//            location: .init(coordinates: locationService.currentLocation, name: locationName),
//            category: activeTraining.category,
//            excercises: activeTraining.excercises)
    }
    
    func showDiscardTrainingConfirmation() {
        confirmationData = ConfirmationData(title: "Discard Training?", message: "No info will be saved.", confirmTitle: "Discard") { [weak self] in
            self?.onDismissed?()
        }
    }
}
