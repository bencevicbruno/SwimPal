//
//  TrainingsContentView.swift
//  SwimPal
//
//  Created by Bruno Benčević on 26.07.2022..
//

import SwiftUI

struct TrainingsContentView: View {
    
    let headerData: TrainingHeaderData
    let trainings: [Training]
    let onTrainingCellTapped: UUIDCallback?
    let onTrainingCellOptionsTapped: UUIDCallback?
    let onStartTrainingTapped: EmptyCallback?
    
    init(headerData: TrainingHeaderData, trainings: [Training], onTrainingCellTapped: UUIDCallback? = nil, onTrainingCellOptionsTapped: UUIDCallback? = nil, onStartTrainingTapped: EmptyCallback? = nil) {
        self.headerData = headerData
        self.trainings = trainings
        self.onTrainingCellTapped = onTrainingCellTapped
        self.onTrainingCellOptionsTapped = onTrainingCellOptionsTapped
        self.onStartTrainingTapped = onStartTrainingTapped
    }
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView(.vertical) {
                LazyVStack(spacing: 10) {
                    if trainings.count > 3 {
                        TrainingsHeader(headerData)
                            .addShadow(.small)
                    }
                    
                    trainingsList
                        .padding(.bottom, MainTabBar.height + UIScreen.bottomUnsafePadding)
                }
                .padding(10)
            }
            
            startTrainingButton
                .padding(.bottom, MainTabBar.height + UIScreen.bottomUnsafePadding)
        }
    }
}

private extension TrainingsContentView {
    
    var trainingsList: some View {
        LazyVStack(spacing: 10) {
            ForEach(trainings) { training in
                TrainingCell(training, onTapped: onTrainingCellTapped, onOptionsTapped: onTrainingCellOptionsTapped)
                    .addShadow(.custom(.shadow, 10, 4))
            }
        }
    }
    
    var startTrainingButton: some View {
        ZStack {
            Circle()
                .fill(Color.white)
            
            Image("icon_plus")
                .frameForIcon()
                .padding(5)
        }
        .frame(60)
        .clipShape(Circle())
        .onTapGesture {
            onStartTrainingTapped?()
        }
        .addShadow()
        .padding(.trailing, 15)
    }
}

struct TrainingsContentView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingsContentView(headerData: .init(totalDistance: .zero, totalTime: .zero, maxSpeed: .zero, favoriteCategory: .random), trainings: [.random, .random, .random])
    }
}
