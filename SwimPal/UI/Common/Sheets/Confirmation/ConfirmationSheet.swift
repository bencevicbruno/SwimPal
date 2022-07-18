//
//  ConfirmationSheet.swift
//  SwimPal
//
//  Created by Bruno Benčević on 15.06.2022..
//

import SwiftUI

struct ConfirmationSheet: View {
    
    @Binding var isVisible: Bool
    
    private let data: ConfirmationData
    
    var body: some View {
        SheetBase($isVisible) { dismiss in
            VStack(spacing: 0) {
                SheetTitle(data.title)
                    .padding(.vertical, 24)
                
                SheetDescription(data.message)
                    .padding(.bottom, 24)
                
                HStack(spacing: 24) {
                    SheetButton(data.cancelTitle, style: .secondary) {
                        dismiss {}
                    }
                    
                    SheetButton(data.confirmTitle) {
                        dismiss {
                            data.action?()
                        }
                    }
                }
            }
            .padding(.horizontal, SheetUtils.horizontalPadding)
            .padding(.bottom, SheetUtils.bottomContentPadding)
        }
    }
    
    init(_ isVisible: Binding<Bool>, data: ConfirmationData) {
        self._isVisible = isVisible
        self.data = data
    }
}

struct ConfirmationSheet_Previews: PreviewProvider {
    static var previews: some View {
        ZStack(alignment: .bottom) {
            Color.yellow
            
            ConfirmationSheet(.constant(true), data: .init(title: "Delete all data?", message: "Changes can't be undone if you delete all your data."))
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}
