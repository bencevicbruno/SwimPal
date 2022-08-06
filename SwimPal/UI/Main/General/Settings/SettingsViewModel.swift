//
//  SettingsViewModel.swift
//  SwimPal
//
//  Created by Bruno Benčević on 11.06.2022..
//

import Combine
import SwiftUI

final class SettingsViewModel: ObservableObject {
    
    var onDismissed: EmptyCallback?
    
    @Published var optionsData: RadioOptionsData?
    
    @Dependency private var persistenceService: PersistenceServiceProtocol
    
    init() {
        
    }
    
    var currentLanguage: Language {
        persistenceService.language
    }
    
    var currentUnitSystem: UnitSystem {
        persistenceService.unitSystem
    }
    
}

    // MARK: - User Ineractions
extension SettingsViewModel {
    
    func dismiss() {
        onDismissed?()
    }
    
    func languageTapped() {
        showLanguageOptions()
    }
    
    func unitSystemTapped() {
        showUnitSystemOptions()
    }
}

private extension SettingsViewModel {
    
    func showLanguageOptions() {
        optionsData = RadioOptionsData(title: Localizable.select_language, options: Language.allCases.map { $0.title }) { [weak self] index in
            guard let self = self else { return }
            
            self.persistenceService.language = Language.allCases[index]
            RefreshToken.instance.refresh()
        }
    }
    
    func showUnitSystemOptions() {
        optionsData = RadioOptionsData(title: Localizable.select_unit_system, options: UnitSystem.allCases.map { $0.title }) { [weak self] index in
            guard let self = self else { return }
            
            self.persistenceService.unitSystem = UnitSystem.allCases[index]
        }
    }
}
