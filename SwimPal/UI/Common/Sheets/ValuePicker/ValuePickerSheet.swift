//
//  ValuePickerSheet.swift
//  SwimPal
//
//  Created by Bruno Benčević on 17.07.2022..
//

import SwiftUI

struct ValuePickerSheet<T: Hashable>: View {
    
    @Binding var isVisible: Bool
    
    @State private var sheetHeight: CGFloat = 0
    @State private var didAppear = false
    
    @State private var dragOffset: CGFloat = 0
    @State private var initialDragPosition: CGFloat = 0
    @State private var didSetInitialDragPosition = false
    
    @State private var value: T?
    
    private let data: ValuePickerData<T>
    
    var body: some View {
        SheetBase($isVisible) { dismiss in
            VStack(spacing: 0) {
                SheetTitle(data.title)
                    .padding(.top, 24)
                    .padding(.bottom, 12)
                
                if let description = data.description {
                    SheetDescription(description)
                }
                
                picker
                    .frame(width: UIScreen.width - 20, height: 100)
                    .clipped()
                
                HStack(spacing: 24) {
                    SheetButton(data.cancelTitle, style: .secondary) {
                        dismiss {}
                    }
                    
                    SheetButton(data.okTitle) {
                        dismiss {
                            if let value = value {
                                data.action?(value)
                            }
                        }
                    }
                }
            }
            .padding(.horizontal, SheetUtils.horizontalPadding)
            .padding(.bottom, SheetUtils.bottomContentPadding)
        }
    }
    
    init(_ isVisible: Binding<Bool>, data: ValuePickerData<T>) {
        self._isVisible = isVisible
        self.data = data
    }
}

private extension ValuePickerSheet {
    
    var picker: some View {
        Picker("", selection: $value) {
            Text("None")
                .tag(nil as T?)
            
            ForEach(data.items) {
                Text($0.title)
                    .tag($0.value as T?)
            }
        }
        .pickerStyle(.wheel)
    }
}

struct ValuePickerSheet_Previews: PreviewProvider {
    static var previews: some View {
        ZStack(alignment: .bottom) {
            Color.yellow
            
            ValuePickerSheet(.constant(true), data: .init(title: "Pick a value", items: (1...10).map { .init(title: "#\($0)", value: $0) }))
        }
        .ignoresSafeArea(.all, edges: .bottom)
        
        ZStack(alignment: .bottom) {
            Color.yellow
            
            ValuePickerSheet(.constant(true), data: .init(title: "Pick a value", description: "This is a sample description", items: (1...10).map { .init(title: "#\($0)", value: $0) }))
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}
