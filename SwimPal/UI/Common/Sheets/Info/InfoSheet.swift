//
//  InfoSheet.swift
//  SwimPal
//
//  Created by Bruno Benčević on 20.06.2022..
//

import SwiftUI

struct InfoSheet: View {
    
    @Binding var isVisible: Bool
    
    private let data: InfoData
    
    var body: some View {
        SheetBase($isVisible) { dismiss in
            VStack(spacing: 0) {
                SheetTitle(data.title)
                    .padding(.vertical, 24)
                
                SheetDescription(data.message)
                    .padding(.bottom, 24)
                
                SheetButton(data.okTitle) {
                    dismiss {
                        data.action?()
                    }
                }
            }
        }
        .padding(.horizontal, SheetUtils.horizontalPadding)
        .padding(.bottom, SheetUtils.bottomContentPadding)
    }
    
    init(_ isVisible: Binding<Bool>, data: InfoData) {
        self._isVisible = isVisible
        self.data = data
    }
}

struct InfoSheet_Previews: PreviewProvider {
    static var previews: some View {
        ZStack(alignment: .bottom) {
            Color.yellow
            
            InfoSheet(.constant(true), data: .init(title: "Delete all data?", message: "Changes can't be undone if you delete all your data."))
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}
