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
    
    @Published var optionsData: OptionsData?
    
    init() {
    }
    
    // MARK: - User Ineractions
    
    func dismiss() {
        onDismissed?()
    }
    
    func showLanguageOptions() {
        optionsData = OptionsData(title: Localizable.select_language, options: ["English", "Deutsch", "Hrvatski", "Deutsch", "Hrvatski", "Deutsch", "Hrvatski", "Deutsch", "Hrvatski", "Deutsch", "Hrvatski", "Deutsch", "Hrvatski", "Deutsch", "Hrvatski", "Deutsch", "Hrvatski"]) { index in
            print("Chose \(["English", "Deutsch", "Hrvatski"][index])")
        }
    }
    
    func showUnitSystemOptions() {
        optionsData = OptionsData(title: Localizable.select_language, options: ["Metric", "Imperial"]) { index in
            print("Chose \(["Metric", "Imperial"][index])")
        }
    }
}
