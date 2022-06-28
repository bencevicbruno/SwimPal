//
//  TrainingSelectionData.swift
//  SwimPal
//
//  Created by Bruno Benčević on 22.06.2022..
//

import SwiftUI

struct TrainingSelectionData {
    let onCategorySelected: ((Training.Category) -> Void)?
    
    init(onCategorySelected: ((Training.Category) -> Void)? = nil) {
        self.onCategorySelected = onCategorySelected
    }
}

extension View {
    
    func trainingSelectionSheet(_ data: Binding<TrainingSelectionData?>) -> some View {
        let isVisible = Binding(
            get: { data.wrappedValue != nil },
            set: { value in
                if !value {
                    data.wrappedValue = nil
                }
            }
        )
        
        return ZStack {
            self
            
            if let data = data.wrappedValue {
                TrainingSelectionSheet(isVisible, data: data)
            }
        }
    }
}
