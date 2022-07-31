//
//  ActiveTrainingView.swift
//  SwimPal
//
//  Created by Bruno Benčević on 28.06.2022..
//

import SwiftUI

struct ActiveTrainingView: View {
    
    @ObservedObject var viewModel: ActiveTrainingViewModel
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                NavigationBar(Localizable.training, onXTapped: viewModel.endTraining)
                
                Spacer()
                
                BigBottomButton(viewModel.isLastExcecise ? "Done" : "Next", onTapped: viewModel.nextTapped)
                    .addShadow()
                    .onLongPressGesture(minimumDuration: 0.5, maximumDistance: 5.0) {
                        viewModel.finishTraining()
                    }
            }
            
            content
                .padding(.top, NavigationBar.height)
                .padding(.bottom, BigBottomButton.totalHeight)
        }
        .setupView()
        .edgesIgnoringSafeArea(.bottom)
        .onAppear {
            viewModel.startTimer()
        }
        .confirmationSheet($viewModel.confirmationData)
    }
}

private extension ActiveTrainingView {
    
    var content: some View {
        VStack(spacing: 0) {
            timerCard
                .addShadow(.small)
                .padding(.top, 30)
                .padding(.bottom, 20)
            
            ScrollView(.vertical) {
                ScrollViewReader { value in
                    TrainingExcerciseList(excercises: viewModel.excercises)
                        .padding(.horizontal, 12)
                        .padding(.bottom, 60)
                        .onAppear {
                            viewModel.onScrollTo = { index in
                                value.scrollTo(viewModel.excercises[index].id, anchor: .bottom)
                            }
                        }
                }
            }
        }
    }
    
    var timerCard: some View {
        Text(Time(viewModel.timerCounter).getFormatted(with: .hoursMinutesSeconds))
            .style(.roboto(.display1, .bold), .black)
            .padding(15, .standard)
            .background(Color.white)
            .clipShape(.roundedRectangle(15))
    }
}

struct ActiveTrainingView_Previews: PreviewProvider {
    static var previews: some View {
        ActiveTrainingView(viewModel: .init(activeTraining: ActiveTraining(category: Training.Category.everythingX4, excercises: Training.Category.lifeguard.excercises)))
    }
}
