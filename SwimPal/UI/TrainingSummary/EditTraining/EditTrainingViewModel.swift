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
    
    @Published var isActivityRunning = false
    @Published var textInputData: TextInputData?
    
    @Dependency private var trainingService: TrainingsServiceProtocol
    
    private let trainingID: UUID
    
    init(trainingID: UUID, model: EditTrainingModel) {
        self.trainingID = trainingID
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
        isActivityRunning = true
        
        trainingService.editTraining(withID: trainingID, with: EditTrainingModel(name: name, location: location, notes: notes.nilIfEmpty)) { [weak self] result in
            guard let self = self else { return }
            self.isActivityRunning = false
            
            switch result {
            case .success:
                NotificationCenter.default.post(name: .reloadTraining, object: nil)
                self.onDismissed?()
            case .failure(let error):
                debugError("Error editing note", error)
            }
            
        }
    }
}
