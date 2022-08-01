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
    var onTrainingSaved: ((Training) -> Void)?
    
    @Published var name: String
    @Published var location: Training.Location?
    @Published var notes: String?
    
    @Published var confirmationData: ConfirmationData?
    @Published var fieldInputData: FieldInputData?
    @Published var textInputData: TextInputData?
    @Published var infoData: InfoData?
    
    let activeTraining: ActiveTraining
    
    @Dependency var locationService: LocationService
    
    init(activeTraining: ActiveTraining) {
        self.activeTraining = activeTraining
        self.name = activeTraining.category.title + " @ " + Date().formatted(as: "EEE, MMM d yyyy")
    }
}

extension SaveTrainingViewModel {
    
    func xTapped() {
        UIApplication.hideKeyboard()
        
        confirmationData = ConfirmationData(title: "Discard Training?", message: "No info will be saved.", confirmTitle: "Discard") { [weak self] in
            self?.onDismissed?()
        }
    }
    
    func editNameTapped() {
        fieldInputData = .init(title: "Enter name", preenteredText: name, validators: [TextFieldValidator.nonEmpty]) { [weak self] newName in
            self?.name = newName
        }
    }
    
    func addLocationTapped() {
        onGoToLocationPicker?()
    }
    
    func addNotesTapped() {
        textInputData = .init(title: "Add notes", text: notes, okTitle: "Done") { [weak self] newNotes in
            self?.notes = newNotes
        }
    }
    
    func doneTapped() {
        guard let time = activeTraining.time else { return }
        
        let training = Training(name: name, time: time, location: location, category: activeTraining.category, exercises: activeTraining.excercises, notes: notes)
        onTrainingSaved?(training)
    }
}
