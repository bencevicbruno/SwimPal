//
//  OptionsSheet.swift
//  SwimPal
//
//  Created by Bruno Benčević on 11.07.2022..
//

import SwiftUI

struct OptionsSheet: View {
    
    @Binding var isVisible: Bool
    
    private let data: OptionsData
    
    var body: some View {
        SheetBase($isVisible) { dismiss in
            VStack(alignment: .leading, spacing: 0) {
                SheetTitle(data.title)
                    .padding(.vertical, 24)
                    .padding(.horizontal, SheetUtils.horizontalPadding)
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 12) {
                        ForEach(0..<data.items.count, id: \.self) { index in
                            optionCell(for: index) {
                                dismiss { data.onTapped?(index) }
                            }
                        }
                    }
                    .padding(.horizontal, SheetUtils.horizontalPadding)
                }
                .frame(maxHeight: min(idealHeight, UIScreen.main.bounds.height * 3.0 / 4.0))
                .padding(.bottom, max(12, UIScreen.bottomUnsafePadding))
            }
        }
    }
    
    init(_ isVisible: Binding<Bool>, data: OptionsData) {
        self._isVisible = isVisible
        self.data = data
    }
}

private extension OptionsSheet {
    
    var idealHeight: CGFloat {
        let rowHeight = 60 + 12
        return CGFloat(data.items.count * rowHeight)
    }
    
    func optionCell(for index: Int, action: EmptyCallback? = nil) -> some View {
        HStack {
            Image(data.items[index].iconName)
                .frameForIcon()
            
            Text(verbatim: data.items[index].title)
                .style(.roboto(.body, .bold), .brand, .leading)
            
            Spacer(minLength: 8)
        }
        .padding(.vertical, 20)
        .padding(.leading, 8)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.brand, lineWidth: 2)
        )
        .onTapGesture {
            action?()
        }
    }
}

struct OptionsSheet_Previews: PreviewProvider {
    static var previews: some View {
        ZStack(alignment: .bottom) {
            Color.yellow
            
            OptionsSheet(.constant(true), data: .init(title: "Options Sheet Example", items: (1...5).map { .init(iconName: "icon_edit", title: "Option #\($0)") }))
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}
