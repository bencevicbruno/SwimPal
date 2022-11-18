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
    
    @Published var optionsSheetData: NewOptionsSheetData?
    
    @Service private var persistenceService: PersistenceServiceProtocol
    
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
        optionsSheetData = .init(title: Localizable.select_language, options: Language.allCases.map { .radioButton(title: $0.title, isSelected: $0 == currentLanguage) }, onOptionSelected: { [weak self] option in
            guard let self = self else { return }
            
            self.persistenceService.language = Language.allCases[option]
            RefreshToken.instance.refresh()
        })
    }
    
    func showUnitSystemOptions() {
        optionsSheetData = .init(title: Localizable.select_unit_system, options: UnitSystem.allCases.map { .radioButton(title: $0.title, isSelected: $0 == currentUnitSystem) }, onOptionSelected: { [weak self] option in
            guard let self = self else { return }
            
            self.persistenceService.unitSystem = UnitSystem.allCases[option]
        })
    }
}
