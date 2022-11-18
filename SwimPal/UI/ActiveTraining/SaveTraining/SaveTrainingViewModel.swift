//
//  SaveTrainingViewModel.swift
//  SwimPal
//
//  Created by Bruno Benčević on 28.06.2022..
//

import SwiftUI

final class SaveTrainingViewModel: ObservableObject {
    
    var onDismissed: EmptyCallback?
    var onGoToLocationPicker: EmptyCallback?
    var onTrainingSaved: ((UUID) -> Void)?
    
    @Published var name: String
    @Published var location: Training.Location?
    @Published var notes: String?
    
    @Published var isActivityRunning = false
    @Published var confirmationData: ConfirmationData?
    @Published var fieldInputData: FieldInputData?
    @Published var textInputData: TextInputData?
    @Published var infoData: InfoData?
    
    
    let activeTraining: ActiveTraining
    
    @Service var locationService: LocationService
    @Service var trainingsService: TrainingsServiceProtocol
    
    init(activeTraining: ActiveTraining) {
        self.activeTraining = activeTraining
        self.name = activeTraining.category.title + " @ " + Date().formatted(as: "EEE, MMM d yyyy")
    }
}

extension SaveTrainingViewModel {
    
    func xTapped() {
        guard !isActivityRunning else { return }
        UIApplication.hideKeyboard()
        
        confirmationData = ConfirmationData(title: Localizable.confirmation_discard_training_title, message: Localizable.confirmation_discard_training_message, confirmTitle: Localizable.discard) { [weak self] in
            self?.onDismissed?()
        }
    }
    
    func editNameTapped() {
        guard !isActivityRunning else { return }
        
        fieldInputData = .init(title: Localizable.enter_name, preenteredText: name, validators: [TextFieldValidator.nonEmpty]) { [weak self] newName in
            self?.name = newName
        }
    }
    
    func addLocationTapped() {
        guard !isActivityRunning else { return }
        
        onGoToLocationPicker?()
    }
    
    func addNotesTapped() {
        guard !isActivityRunning else { return }
        
        textInputData = .init(title: Localizable.add_notes, text: notes, okTitle: Localizable.done) { [weak self] newNotes in
            self?.notes = newNotes.isEmpty ? nil : newNotes
        }
    }
    
    func doneTapped() {
        guard !isActivityRunning,
              let time = activeTraining.time else { return }
        isActivityRunning = true
        
        let training = Training(name: name, time: time, location: location, category: activeTraining.category, exercises: activeTraining.excercises, notes: notes)
        
        trainingsService.saveTraining(training) { [weak self] result in
            guard let self = self else { return }
            self.isActivityRunning = false
            
            switch result {
            case .success:
                NotificationCenter.default.post(name: .reloadTrainings, object: nil)
                self.onTrainingSaved?(training.id)
            case .failure(let error):
                print(error)
            }
        }
    }
}
