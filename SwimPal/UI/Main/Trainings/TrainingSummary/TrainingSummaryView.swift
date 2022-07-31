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
            NavigationBar("Training Summary", onBackTapped: viewModel.dismiss, rightIconName: "icon_back", onRightItemTapped: viewModel.editTrainingTapped)
            
            ScrollView(.vertical) {
                content
                    .padding([.horizontal, .top], 10)
            }
        }
        .setupView()
    }
}

private extension TrainingSummaryView {
    
    var content: some View {
        LazyVStack(spacing: 20) {
            TrainingSummaryHeader(viewModel.training)
                .addShadow(.small)
            
            TrainingSummaryExercisesCard(viewModel.training)
                .addShadow(.small)
            
            if let location = viewModel.training.location {
                TrainingSummaryLocationCard(location)
                    .addShadow(.small)
            }
            
            if let notes = viewModel.training.notes {
                TrainingSummaryNotesCard(notes)
                    .addShadow()
            }
        }
    }
}

struct TrainingSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingSummaryView(viewModel: .init(training: .sample))
    }
}
