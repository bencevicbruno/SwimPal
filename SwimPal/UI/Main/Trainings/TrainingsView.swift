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
//            title
//                .padding(10)
            
            content
        }
        .removeNavigationBar()
        .trainingSelectionSheet($viewModel.trainingSelectionData)
        .optionsSheet($viewModel.optionsData)
        .confirmationSheet($viewModel.confirmationData)
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
                ZStack(alignment: .bottomTrailing) {
                    trainingList
                }
            }
        }
    }
    
    var newTrainingButton: some View {
        ZStack {
            Circle()
                .fill(Color.brand)
            
            Text("+")
                .style(.roboto(.display1, .bold), .white)
                .padding(5)
        }
        .frame(60)
        .clipShape(Circle())
        .onTapGesture {
            viewModel.showTrainingOptions()
        }
        .shadow(color: .black.opacity(0.1), radius: 4)
    }
    
    var trainingList: some View {
        ZStack {
            ScrollView(.vertical) {
                LazyVStack(spacing: 8) {
                    title
                        .padding(.top, 10)
                    
                    ForEach(0..<viewModel.trainings.count) { index in
                        TrainingCell(training: viewModel.trainings[index], onTapped: { viewModel.trainingOptionsTapped(index: index) })
                            .onTapGesture {
                                viewModel.trainingTapped(index: index)
                            }
                    }
                }
                .padding(.horizontal, 10)
                .padding(.bottom, MainTabBar.height)
            }
            
            VStack(spacing: 0) {
                Spacer()
                
                HStack(spacing: 0) {
                    Spacer()
                    
                    newTrainingButton
                        .padding(.bottom, MainTabBar.height)
                        .padding(.trailing, 10)
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
