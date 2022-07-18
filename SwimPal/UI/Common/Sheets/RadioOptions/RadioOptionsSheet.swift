//
//  RadioOptionsSheet.swift
//  SwimPal
//
//  Created by Bruno Benčević on 20.06.2022..
//

import SwiftUI

struct RadioOptionsSheet: View {
    
    @Binding var isVisible: Bool
    
    private let data: RadioOptionsData
    
    var body: some View {
        SheetBase($isVisible) { dismiss in
            VStack(alignment: .leading, spacing: 0) {
                Text(data.title)
                    .fontWeight(.bold)
                    .foregroundColor(.brand)
                    .padding(.vertical, 24)
                    .padding(.horizontal, 12)
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 12) {
                        ForEach(0..<data.options.count, id: \.self) { index in
                            optionCell(for: index) {
                                dismiss { data.action?(index) }
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
    
    init(_ isVisible: Binding<Bool>, data: RadioOptionsData) {
        self._isVisible = isVisible
        self.data = data
    }
}

private extension RadioOptionsSheet {
    
    var idealHeight: CGFloat {
        let rowHeight = 60 + 12
        return CGFloat(data.options.count * rowHeight)
    }
    
    func optionCell(for index: Int, action: EmptyCallback? = nil) -> some View {
        HStack {
            Text(verbatim: data.options[index])
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
                .foregroundColor(.white)
            
            Spacer(minLength: 8)
        }
        .padding(.vertical, 20)
        .padding(.leading, 8)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(index != 0 ? Color.brand : Color.brangLight)
        )
        .onTapGesture {
            action?()
        }
    }
}

struct RadioOptionsSheet_Previews: PreviewProvider {
    static var previews: some View {
        ZStack(alignment: .bottom) {
            Color.yellow
            
            RadioOptionsSheet(.constant(true), data: .init(title: "Choose Language", options: ["Croatian", "german", "english", "Croatian", "german", "english", "Croatian", "german", "english", "Croatian", "german", "english"]))
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}
