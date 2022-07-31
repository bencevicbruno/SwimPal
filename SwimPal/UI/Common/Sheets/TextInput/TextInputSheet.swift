//
//  TextInputSheet.swift
//  SwimPal
//
//  Created by Bruno Benčević on 29.07.2022..
//

import SwiftUI

struct TextInputSheet: View {
    
    @Binding var isVisible: Bool
    
    @State private var fieldText: String
    
    private let data: TextInputData
    
    var body: some View {
        SheetBase($isVisible) { dismiss in
            VStack(spacing: 0) {
                SheetTitle(data.title)
                    .padding(.vertical, 24)
                
                if let description = data.description {
                    SheetDescription(description)
                        .padding(.bottom, 24)
                }
                
                SPTextEditor(hint: data.hint, $fieldText)
                    .padding(.bottom, 20)
                
                SheetButton(data.okTitle) {
                    dismiss {
                        UIApplication.hideKeyboard()
                        data.action?(fieldText)
                    }
                }
            }
            .padding(.horizontal, SheetUtils.horizontalPadding)
            .padding(.bottom, SheetUtils.bottomContentPadding)
            .background(Color.white)
            .frame(height: UIScreen.height * 0.5)
        }
    }
    
    init(_ isVisible: Binding<Bool>, data: TextInputData) {
        self._isVisible = isVisible
        self.data = data
        self.fieldText = data.text ?? ""
    }
}

struct TextInputSheet_Previews: PreviewProvider {
    static var previews: some View {
        ZStack(alignment: .bottom) {
            Color.yellow
            
            TextInputSheet(.constant(true), data: .init(title: "Insert location name"))
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

