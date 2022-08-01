//
//  SettingsView.swift
//  SwimPal
//
//  Created by Bruno Benčević on 11.06.2022..
//

import SwiftUI

struct SettingsView: View {
    
    @ObservedObject var viewModel: SettingsViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            NavigationBar(Localizable.settings, onBackTapped: viewModel.dismiss)
            
            ScrollView(.vertical) {
                LazyVStack(spacing: 15) {
                    SettingCell("Language", value: "English", onTapped: viewModel.languageTapped)
                        .addShadow(.small)
                    
                    SettingCell("Unit System", value: "Metric", onTapped: viewModel.unitSystemTapped)
                        .addShadow(.small)
                }
                .padding([.top, .horizontal], 10)
            }
        }
        .setupView()
        .optionsSheet($viewModel.optionsData)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(viewModel: .init())
    }
}
