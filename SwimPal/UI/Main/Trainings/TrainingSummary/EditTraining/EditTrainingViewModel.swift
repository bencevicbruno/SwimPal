//
//  EditTrainingViewModel.swift
//  SwimPal
//
//  Created by Bruno Benčević on 31.07.2022..
//

import SwiftUI

final class EditTrainingViewModel: ObservableObject {
    
    var onDismissed: EmptyCallback?
    var onGoToLocationPicker: EmptyCallback?
    var onSaved: ((EditTrainingModel) -> Void)?
    
    @Published var name: String
    @Published var location: Training.Location?
    @Published var notes: String?
    
    @Published var textInputData: TextInputData?
    
    init(model: EditTrainingModel) {
        self.name = model.name
        self.location = model.location
        self.notes = model.notes
    }
    
    var isFormValid: Bool {
        !name.isEmpty
    }
}

// MARK: - User Interaction
extension EditTrainingViewModel {
    
    func backTapped() {
        onDismissed?()
    }
    
    func addLocationTapped() {
        onGoToLocationPicker?()
    }
    
    func addNotesTapped() {
        let title = (notes == nil || (notes?.isEmpty ?? false)) ? "Add notes" : "Edit notes"
        textInputData = .init(title: title, text: notes) { [weak self] newNotes in
            self?.notes = newNotes.isEmpty ? nil : newNotes
        }
    }
    
    func saveTapped() {
        onSaved?(EditTrainingModel(name: name, location: location, notes: notes))
    }
}
