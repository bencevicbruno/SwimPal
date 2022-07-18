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
        VStack(spacing: 0) {
            NavigationBar(Localizable.training, onXTapped: viewModel.endTraining)
            
            ZStack(alignment: .bottom) {
                content
                    .padding(.bottom, 60)
                
                doneButton
            }
        }
        .removeNavigationBar()
        .onAppear {
            viewModel.startTimer()
        }
        .confirmationSheet($viewModel.confirmationData)
    }
}

private extension ActiveTrainingView {
    
    var content: some View {
        VStack(spacing: 0) {
            Text(verbatim: Time(viewModel.timerCounter).getFormatted(with: .hoursMinutesSeconds))
                .padding(.vertical, 20)
            
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
    
    var doneButton: some View {
        Text((viewModel.isLastExcecise ? "Done" : "Next").uppercased())
            .style(.roboto(.headline1, .bold), .white)
            .padding(5, .standard)
            .frame(height: 60)
            .frame(maxWidth: .infinity)
            .background(Color.brand)
            .onTapGesture {
                viewModel.nextTapped()
            }
            .onLongPressGesture(minimumDuration: 0.5, maximumDistance: 5.0) {
                viewModel.finishTraining()
            }
    }
}

struct ActiveTrainingView_Previews: PreviewProvider {
    static var previews: some View {
        ActiveTrainingView(viewModel: .init(activeTraining: ActiveTraining(category: Training.Category.everythingX4, excercises: Training.Category.lifeguard.excercises)))
    }
}
