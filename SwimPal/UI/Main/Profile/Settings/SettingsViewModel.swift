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
    
    init() {
        
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
        optionsData = RadioOptionsData(title: Localizable.select_language, options: ["English", "Deutsch", "Hrvatski"]) { index in
            print("Chose \(["English", "Deutsch", "Hrvatski"][index])")
        }
    }
    
    func showUnitSystemOptions() {
        optionsData = RadioOptionsData(title: Localizable.select_language, options: ["Metric", "Imperial"]) { index in
            print("Chose \(["Metric", "Imperial"][index])")
        }
    }
}
