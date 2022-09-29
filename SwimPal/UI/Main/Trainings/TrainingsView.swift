//
//  TrainingsView.swift
//  SwimPal
//
//  Created by Bruno Benčević on 02.06.2022..
//

import SwiftUI

struct TrainingsView: View {
    
    @ObservedObject var viewModel: TrainingsViewModel
    
    var body: some View {
        ZStack(alignment: .top) {
            content
                .padding(.top, MainTitle.totalHeight)
            
            title
        }
        .setupView()
        .edgesIgnoringSafeArea(.bottom)
        .trainingSelectionSheet($viewModel.trainingSelectionData)
        .newOptionsSheet($viewModel.optionsSheetData)
        .confirmationSheet($viewModel.confirmationData)
    }
    
    init(_ viewModel: TrainingsViewModel) {
        self.viewModel = viewModel
    }
}

private extension TrainingsView {
    
    var title: some View {
        VStack(spacing: 0) {
            MainTitle(Localizable.trainings)
            
            Spacer()
        }
    }
    
    @ViewBuilder
    var content: some View {
        Group {
            if viewModel.trainings.isEmpty {
                TrainingsEmptyView(onStartTrainingTapped: viewModel.startTrainingTapped)
            } else {
                TrainingsContentView(scrollingEnabled: viewModel.scrollingEnabled, headerData: viewModel.headerData, trainings: viewModel.trainings, onTrainingCellTapped: viewModel.trainingCellTapped, onTrainingCellOptionsTapped: viewModel.trainingCellOptionsTapped, onStartTrainingTapped: viewModel.startTrainingTapped)
            }
        }
        .activityIndicator(viewModel.isActivityRunning)
    }
}

struct TrainingsView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingsView(.mocked)
        
        TrainingsView(.mockedEmpty)
        
        TrainingsView(.mockedError)
    }
}
