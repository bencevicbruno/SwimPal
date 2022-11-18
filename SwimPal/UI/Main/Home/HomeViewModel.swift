//
//  HomeViewModel.swift
//  SwimPal
//
//  Created by Bruno Benčević on 02.06.2022..
//

import SwiftUI

final class HomeViewModel: ObservableObject {
    
    var onGoToTrainingPreparation: ((Training.Category) -> Void)?
    
    @Published var currentMotivationIndex = 0
    
    var motivations = Motivation.samples
    
    @Service var persistenceService: PersistenceServiceProtocol
    
    init() {
        changeMotivation()
    }
    
    var title: String {
        if let userName = persistenceService.user?.name.components(separatedBy: " ").first {
            return Localizable.greeting_with_name.replacingOccurrences(of: "%s", with: userName)
        } else {
            return Localizable.greeting_without_name
        }
    }
    
    var userName: String {
        String(persistenceService.user?.name.split(separator: " ").first ?? "swimmer")
    }
    
    func changeMotivation() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [weak self] in
            guard let self = self else { return }
            
            self.currentMotivationIndex = (self.currentMotivationIndex + 1) % self.motivations.count
            self.changeMotivation()
        }
    }
    
    func goToTrainingPreparation(category: Training.Category) {
        onGoToTrainingPreparation?(category)
    }
}
