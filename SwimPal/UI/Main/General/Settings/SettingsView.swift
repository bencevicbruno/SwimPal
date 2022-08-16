//
//  SettingsView.swift
//  SwimPal
//
//  Created by Bruno Benčević on 11.06.2022..
//

import SwiftUI

struct SettingsView: View {
    
    @ObservedObject var viewModel: SettingsViewModel
    @ObservedObject var refreshToken = RefreshToken.instance
    
    var body: some View {
        VStack(spacing: 0) {
            NavigationBar(Localizable.title_settings, onBackTapped: viewModel.dismiss)
            
            ScrollView(.vertical) {
                LazyVStack(spacing: 15) {
                    SettingCell(Localizable.setting_language, value: viewModel.currentLanguage.title, onTapped: viewModel.languageTapped)
                        .addShadow(.small)
                    
                    SettingCell(Localizable.setting_unit_system, value: viewModel.currentUnitSystem.title, onTapped: viewModel.unitSystemTapped)
                        .addShadow(.small)
                }
                .padding([.top, .horizontal], 10)
            }
        }
        .setupView()
        .newOptionsSheet($viewModel.optionsSheetData)
        .refreshable(using: refreshToken)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(viewModel: .init())
    }
}
