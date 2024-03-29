//
//  TrainingSummaryView.swift
//  SwimPal
//
//  Created by Bruno Benčević on 28.06.2022..
//

import SwiftUI

struct TrainingSummaryView: View {
    
    @ObservedObject var viewModel: TrainingSummaryViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            NavigationBar(Localizable.training_summary, onBackTapped: viewModel.dismiss, rightIconName: "icon_edit", onRightItemTapped: viewModel.editTrainingTapped)
            
            ScrollView(.vertical) {
                content
                    .padding(10)
            }
            .activityIndicator(viewModel.isActivityRunning)
        }
        .setupView()
    }
}

private extension TrainingSummaryView {
    
    var content: some View {
        LazyVStack(spacing: 20) {
            if let training = viewModel.training {
                TrainingSummaryHeader(training)
                    .addShadow(.small)
                
                TrainingSummaryExercisesCard(training)
                    .addShadow(.small)
                
                if let location = training.location {
                    TrainingSummaryLocationCard(location)
                        .allowsHitTesting(false)
                        .addShadow(.small)
                }
                
                if let notes = training.notes {
                    TrainingSummaryNotesCard(notes)
                        .addShadow()
                }
            }
        }
    }
}

struct TrainingSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingSummaryView(viewModel: .mocked(for: .sample))
    }
}
