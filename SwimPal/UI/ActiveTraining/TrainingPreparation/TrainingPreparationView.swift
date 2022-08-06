//
//  TrainingPreparationView.swift
//  SwimPal
//
//  Created by Bruno Benčević on 28.06.2022..
//

import SwiftUI

struct TrainingPreparationView: View {
    
    @ObservedObject var viewModel: TrainingPreparationViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            NavigationBar("Are you ready?", onXTapped: viewModel.dismiss)
//                .addShadow()
            
            ScrollView(.vertical) {
                content
                    .padding(10)
            }
            .frame(maxHeight: .infinity)
            
            BigBottomButton("Let's go", isEnabled: viewModel.excercises.count != 0, onTapped: viewModel.startTraining)
                .addShadow()
        }
        .setupView()
        .edgesIgnoringSafeArea(.bottom)
    }
}

private extension TrainingPreparationView {
    
    var content: some View {
        VStack(spacing: 10) {
            TrainingPreparationHeader(category: viewModel.category)
                .addShadow(.small)
                .padding(.top, 15)
            
            excercisesTitle
                .padding(.top, 10)
                .padding(.bottom, 5)
            
            exercisesTable
                .padding(.bottom, 10)
        }
    }
    
    var excercisesTitle: some View {
        HStack(spacing: 0) {
            Text(viewModel.excercises.count == 0 ? "Tap + to add Trainings" : "What you'll do")
                .style(.roboto(.headline1, .bold), .brand, .leading)
            
            Spacer(minLength: 0)
        }
        .frame(maxWidth: .infinity)
    }
    
    var exercisesTable: some View {
        LazyVStack(spacing: 2) {
            TrainingExcerciseList(excercises: viewModel.excercises)
            
            if viewModel.category == .custom {
                addExcerciseCell
            }
        }
    }
    
    var addExcerciseCell: some View {
        Text("+")
            .style(.roboto(.headline1, .medium), .brand)
            .frame(height: 60)
            .frame(maxWidth: .infinity)
            .background(Color.gray242)
            .clipShape(.roundedRectangle(15))
            .contentShape(RoundedRectangle(cornerRadius: 15))
            .onTapGesture {
                viewModel.goToAddExercise()
            }
    }
}

struct TrainingPreparationView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingPreparationView(viewModel: .init(category: .custom))
    }
}
