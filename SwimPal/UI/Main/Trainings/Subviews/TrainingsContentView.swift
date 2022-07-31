//
//  TrainingsContentView.swift
//  SwimPal
//
//  Created by Bruno Benčević on 26.07.2022..
//

import SwiftUI

struct TrainingsContentView: View {
    
    let trainings: [Training]
    let onTrainingCellTapped: UUIDCallback?
    let onTrainingCellOptionsTapped: UUIDCallback?
    
    init(trainings: [Training], onTrainingCellTapped: UUIDCallback? = nil, onTrainingCellOptionsTapped: UUIDCallback? = nil) {
        self.trainings = trainings
        self.onTrainingCellTapped = onTrainingCellTapped
        self.onTrainingCellOptionsTapped = onTrainingCellOptionsTapped
    }
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 10) {
                header
                
                trainingsList
                    .padding(.bottom, MainTabBar.height + UIScreen.bottomUnsafePadding)
            }
            .padding(.horizontal, 10)
            .padding(.top, TrainingsView.titleHeight + TrainingsView.titleShadowHeight)
        }
    }
}

private extension TrainingsContentView {
    
    var header: some View {
        TrainingsHeader(totalDistance: .init(5, .kilometers), totalTime: .init(10, .hours), maxSpeed: .init(15, .metersPerSecond), favoriteCategory: .lifeguard)
            .addShadow(.small)
    }
    
    var trainingsList: some View {
        LazyVStack(spacing: 10) {
            ForEach(trainings) { training in
                TrainingCell(training, onTapped: onTrainingCellTapped, onOptionsTapped: onTrainingCellOptionsTapped)
                    .addShadow(.custom(.shadow, 10, 4))
            }
        }
    }
}

struct TrainingsContentView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingsContentView(trainings: [.random, .random, .random])
    }
}
