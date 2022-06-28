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
        VStack(spacing: 0) {
            title
            
            content
        }
        .padding(.horizontal, 10)
        .removeNavigationBar()
    }
    
    init(_ viewModel: TrainingsViewModel) {
        self.viewModel = viewModel
    }
}

private extension TrainingsView {
    
    var title: some View {
        HStack(spacing: 0) {
            Text(Localizable.trainings)
                .style(.roboto(.display1, .bold), .brand)
            
            Spacer()
        }
    }
    
    @ViewBuilder
    var content: some View {
        if viewModel.isActivityRunning {
            Text("Loading...")
        } else if let error = viewModel.error {
            ErrorScreen(error)
        } else {
            if viewModel.trainings.isEmpty {
                EmptyStateScreen(.init(title: "No Trainings", message: "Start swimmin man!", illustrationName: "illustration_noStatistics"))
            } else {
                ScrollView(.vertical) {
                    LazyVStack(spacing: 8) {
                        ForEach(viewModel.trainings, id: \.name) {
                            TrainingCell(training: $0)
                        }
                    }
                }
            }
        }
    }
}

struct TrainingsView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingsView(.init())
    }
}
