//
//  TrainingSelectionSheet.swift
//  SwimPal
//
//  Created by Bruno Benčević on 22.06.2022..
//

import SwiftUI

struct TrainingSelectionSheet: View {
    
    @Binding var isVisible: Bool
    
    @State private var sheetHeight: CGFloat = 0
    @State private var didAppear = false
    @State private var dragOffset: CGFloat = 0
    
    @State private var initialDragPosition: CGFloat = 0
    @State private var didSetInitialDragPosition = false
    
    private let data: TrainingSelectionData
    
    var body: some View {
        SheetBase($isVisible) { dismiss in
            ScrollView(.vertical) {
                TrainingSelection(onCategorySelected: { category in dismiss { data.onCategorySelected?(category) } })
                    .padding(.horizontal, SheetUtils.horizontalPadding)
                    .padding(.bottom, SheetUtils.bottomContentPadding)
            }
            .frame(maxHeight: UIScreen.height * 0.75)
        }
    }
    
    init(_ isVisible: Binding<Bool>, data: TrainingSelectionData) {
        self._isVisible = isVisible
        self.data = data
    }
}

struct TrainingSelectionSheet_Previews: PreviewProvider {
    static var previews: some View {
        ZStack(alignment: .bottom) {
            Color.yellow
            
            TrainingSelectionSheet(.constant(true), data: .init())
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}
