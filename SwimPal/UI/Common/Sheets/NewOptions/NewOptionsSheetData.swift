//
//  NewOptionsSheetData.swift
//  SwimPal
//
//  Created by Bruno Benčević on 08.08.2022..
//

import SwiftUI

struct NewOptionsSheetItem: Equatable {
    let title: String
    let iconName: String
    var isSelected: Bool
    let dismissesWhenSelected: Bool
    
    private init(title: String, iconName: String, isSelected: Bool = false, dismissesWhenSelected: Bool = false) {
        self.title = title
        self.iconName = iconName
        self.isSelected = isSelected
        self.dismissesWhenSelected = dismissesWhenSelected
    }
    
    static func option(title: String, iconName: String) -> NewOptionsSheetItem {
        return NewOptionsSheetItem(title: title, iconName: iconName, dismissesWhenSelected: true)
    }
    
    static func radioButton(title: String, isSelected: Bool) -> NewOptionsSheetItem {
        return NewOptionsSheetItem(title: title, iconName: "icon_radioButton", isSelected: isSelected)
    }
    
    static func checkBox(title: String, isSelected: Bool) -> NewOptionsSheetItem {
        return NewOptionsSheetItem(title: title, iconName: "icon_checkBox", isSelected: isSelected)
    }
    
    var selectedIconName: String {
        isSelected ? "\(iconName)_selected" : "\(iconName)"
    }
}

enum OptionsType {
    case options
    case radioButtons
    case checkBoxes
}

struct NewOptionsSheetData {
    let title: String
    let message: String?
    let confirmTitle: String
    var options: [NewOptionsSheetItem]
    let onOptionSelected: Callback<Int>?
    let onOptionsSelected: Callback<[Int]>?
    
    init(title: String, message: String? = nil, confirmTitle: String = Localizable.confirm, options: [NewOptionsSheetItem], onOptionSelected: Callback<Int>? = nil, onOptionsSelected: Callback<[Int]>? = nil) {
        self.title = title
        self.message = message
        self.confirmTitle = confirmTitle
        self.options = options
        self.onOptionSelected = onOptionSelected
        self.onOptionsSelected = onOptionsSelected
    }
    
    var optionsType: OptionsType {
        if options.first?.iconName.contains("radioButton") ?? false {
            return .radioButtons
        } else if options.first?.iconName.contains("checkBox") ?? false {
            return .checkBoxes
        } else {
            return .options
        }
    }
    
    var selectedIndices: [Int] {
        let selectedOptions = options.filter { $0.isSelected }
        
        return selectedOptions.map { selectedOption in options.firstIndex(where: { $0 == selectedOption })!}
    }
}

extension View {
    
    func newOptionsSheet(_ dataBinding: Binding<NewOptionsSheetData?>) -> some View {
        ZStack {
            self
            
            if let data = dataBinding.wrappedValue {
                NewOptionsSheet(.forVisibility(dataBinding), data: data)
            }
        }
    }
}
