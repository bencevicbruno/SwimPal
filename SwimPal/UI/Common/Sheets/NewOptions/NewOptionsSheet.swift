//
//  NewOptionsSheet.swift
//  SwimPal
//
//  Created by Bruno Benčević on 08.08.2022..
//

import SwiftUI

struct NewOptionsSheet: View {
    
    @Binding var isVisible: Bool
    
    @State private var data: NewOptionsSheetData
    
    var body: some View {
        SheetBase($isVisible) { dismiss in
            VStack(alignment: .leading, spacing: 0) {
                SheetTitle(data.title)
                    .padding(.vertical, 12)
                    .padding(.horizontal, SheetUtils.horizontalPadding)
                
                ScrollView(isContentScrollable ? .vertical : []) {
                    VStack(alignment: .leading, spacing: Self.rowPadding) {
                        ForEach(0..<data.options.count, id: \.self) { index in
                            optionCell(for: index) {
                                if data.optionsType == .checkBoxes {
                                    data.options[index].isSelected.toggle()
                                } else {
                                    dismiss { data.onOptionSelected?(index) }
                                }
                            }
                        }
                        
                        if data.optionsType == .checkBoxes {
                            SheetButton(data.confirmTitle, style: .primary) {
                                dismiss { data.onOptionsSelected?(data.selectedIndices) }
                            }
                        }
                    }
                    .padding(.horizontal, SheetUtils.horizontalPadding)
                    .padding(.bottom, max(12, UIScreen.bottomUnsafePadding))
                }
                .frame(maxHeight: min(idealHeight, Self.maxHeight))
            }
        }
    }
    
    init(_ isVisible: Binding<Bool>, data: NewOptionsSheetData) {
        self._isVisible = isVisible
        self.data = data
    }
    
    static let rowHeight: CGFloat = 40
    static let rowPadding: CGFloat = 10
    static let maxHeight: CGFloat = UIScreen.main.bounds.height * 0.75
}

private extension NewOptionsSheet {
    
    var idealHeight: CGFloat {
        if data.optionsType == .checkBoxes {
            let rowHeight = Self.rowHeight + Self.rowPadding
            let bottomPadding = max(12, UIScreen.bottomUnsafePadding)
            return CGFloat(data.options.count * rowHeight) + Self.rowPadding + SheetButton.height + bottomPadding
        } else {
            let rowHeight = Self.rowHeight + Self.rowPadding
            let bottomPadding = max(12, UIScreen.bottomUnsafePadding)
            return CGFloat(data.options.count * rowHeight) + bottomPadding
        }
    }
    
    var isContentScrollable: Bool {
        idealHeight > Self.maxHeight
    }
    
    func optionCell(for index: Int, action: EmptyCallback? = nil) -> some View {
        HStack {
            if data.optionsType == .options {
                Image(data.options[index].iconName)
                    .frameForIcon()
            } else {
                Image(data.options[index].selectedIconName)
                    .frameForIcon()
            }
            
            Text(verbatim: data.options[index].title)
                .style(.roboto(.body, .bold), .brand, .leading)
            
            Spacer(minLength: 8)
        }
        .frame(maxWidth: .infinity, height: Self.rowHeight)
        .background(Color.white)
        .contentShape(Rectangle())
        .onTapGesture {
            action?()
        }
    }
}

struct NewOptionsSheet_Previews: PreviewProvider {
    static var previews: some View {
        ZStack(alignment: .bottom) {
            Color.yellow
            
            NewOptionsSheet(.constant(true), data: .init(title: "Pick Option", options: [
                .option(title: "Time", iconName: "icon_time"),
                .option(title: "Delete", iconName: "icon_bin"),
                .option(title: "Notes", iconName: "icon_notes")]))
        }
        .ignoresSafeArea(.all, edges: .bottom)
        
        ZStack(alignment: .bottom) {
            Color.yellow
            
            NewOptionsSheet(.constant(true), data: .init(title: "Pick Option", options: [
                .radioButton(title: "Option #1", isSelected: false),
                .radioButton(title: "Option #2", isSelected: true),
                .radioButton(title: "Option #3", isSelected: false)
            ]))
        }
        .ignoresSafeArea(.all, edges: .bottom)
        
        ZStack(alignment: .bottom) {
            Color.yellow
            
            NewOptionsSheet(.constant(true), data: .init(title: "Pick Option", options: [
                .checkBox(title: "Option #1", isSelected: false),
                .checkBox(title: "Option #2", isSelected: true),
                .checkBox(title: "Option #3", isSelected: false),
                .checkBox(title: "Option #4", isSelected: false),
                .checkBox(title: "Option #5", isSelected: true),
                .checkBox(title: "Option #6", isSelected: false),
                .checkBox(title: "Option #7", isSelected: false),
                .checkBox(title: "Option #8", isSelected: true),
                .checkBox(title: "Option #9", isSelected: false),
                .checkBox(title: "Option #10", isSelected: false),
                .checkBox(title: "Option #11", isSelected: true),
                .checkBox(title: "Option #12", isSelected: false),
                .checkBox(title: "Option #13", isSelected: false),
                .checkBox(title: "Option #14", isSelected: true),
                .checkBox(title: "Option #15", isSelected: false)
            ]))
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}
