//
//  TrainingSelection.swift
//  SwimPal
//
//  Created by Bruno Benčević on 22.06.2022..
//

import SwiftUI

struct TrainingSelection: View {
    
    static let spacing: CGFloat = 14
    static let columns = [GridItem(.flexible(), spacing: 14), GridItem(.flexible(), spacing: Self.spacing)]
    
    var onCategorySelected: ((Training.Category) -> Void)?
    
    var body: some View {
        LazyVGrid(columns: Self.columns, spacing: Self.spacing) {
            ForEach(Training.Category.allCases) { category in
                TrainingCard(category: category)
                    .onTapGesture {
                        onCategorySelected?(category)
                    }
            }
        }
    }
}

struct TrainingSelection_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView(.vertical) {
            TrainingSelection()
        }
    }
}
