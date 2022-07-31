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
    
    @Published var name: String
    @Published var location: Training.Location?
    @Published var notes: String?
    
    @Published var textInputData: TextInputData?
    
    init() {
        self.name = "name"
        
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
        onDismissed?()
    }
}
