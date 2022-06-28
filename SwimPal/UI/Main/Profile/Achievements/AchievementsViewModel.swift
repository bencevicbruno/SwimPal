//
//  AchievementsViewModel.swift
//  SwimPal
//
//  Created by Bruno Benčević on 11.06.2022..
//

import SwiftUI

final class AchievementsViewModel: ObservableObject {
    
    var onDismissed: EmptyCallback?
    var onStartTraining: ((Training.Category) -> Void)?
    
    @Published var trainingSelectionData: TrainingSelectionData?
    
    init() {
        
    }
    
    // MARK: - User Ineractions
    
    func dismiss() {
        onDismissed?()
    }
    
    func showTrainingSelection() {
        trainingSelectionData = .init(onCategorySelected: { [weak self] category in
            self?.onStartTraining?(category)
        })
    }
}
