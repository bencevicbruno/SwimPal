//
//  FieldInputSheet.swift
//  SwimPal
//
//  Created by Bruno Benčević on 20.07.2022..
//

import SwiftUI

struct FieldInputSheet: View {
    
    @Binding var isVisible: Bool
    
    @State private var fieldText: String = ""
    
    private let data: FieldInputData
    
    var body: some View {
        SheetBase($isVisible) { dismiss in
            VStack(spacing: 0) {
                SheetTitle(data.title)
                    .padding(.vertical, 24)
                
                if let description = data.description {
                    SheetDescription(description)
                        .padding(.bottom, 24)
                }
                
                SPTextField($fieldText, validators: [TextFieldValidator.length(50)])
                    .padding(.bottom, 20)
                
                SheetButton(data.okTitle) {
                    dismiss {
                        data.action?(fieldText)
                    }
                }
            }
            .padding(.horizontal, SheetUtils.horizontalPadding)
            .padding(.bottom, SheetUtils.bottomContentPadding)
            .background(Color.white)
        }
    }
    
    init(_ isVisible: Binding<Bool>, data: FieldInputData) {
        self._isVisible = isVisible
        self.data = data
    }
}

struct FieldInputSheet_Previews: PreviewProvider {
    static var previews: some View {
        ZStack(alignment: .bottom) {
            Color.yellow
            
            FieldInputSheet(.constant(true), data: .init(title: "Insert location name"))
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

