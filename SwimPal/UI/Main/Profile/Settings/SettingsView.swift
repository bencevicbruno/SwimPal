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
                LazyVStack(spacing: 12) {
                    settingCard("Language", value: "English", onTapped: viewModel.showLanguageOptions)
                    
                    settingCard("Unit System", value: "Metric", onTapped: viewModel.showUnitSystemOptions)
                }
                .padding(.horizontal, 10)
            }
        }
        .removeNavigationBar()
        .background(.white)
        .optionsSheet($viewModel.optionsData)
    }
}

private extension SettingsView {
    
    func settingCard(_ title: String, value: String, onTapped: EmptyCallback? = nil) -> some View {
        HStack {
            Text(verbatim: title)
                .style(.roboto(.headline2, .bold), .white)
            
            Spacer(minLength: 10)
            
            Text(verbatim: value)
                .style(.roboto(.caption), .white)
            
            Image("icon_action")
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
                .frame(width: 40, height: 40)
        }
        .padding(.vertical, 8)
        .padding(.leading, 8)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.brand)
        )
        .onTapGesture {
            onTapped?()
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(viewModel: .init())
    }
}
