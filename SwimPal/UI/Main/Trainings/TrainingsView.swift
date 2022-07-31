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
        ZStack(alignment: .bottomTrailing) {
            content
            
            title
            
            newTrainingButton
                .padding(.bottom, MainTabBar.height + UIScreen.bottomUnsafePadding)
        }
        .edgesIgnoringSafeArea(.bottom)
        .removeNavigationBar()
        .background(Color.white)
        .trainingSelectionSheet($viewModel.trainingSelectionData)
        .optionsSheet($viewModel.optionsData)
        .confirmationSheet($viewModel.confirmationData)
    }
    
    init(_ viewModel: TrainingsViewModel) {
        self.viewModel = viewModel
    }
    
    static let titleHeight: CGFloat = 50
    static let titleShadowHeight: CGFloat = 15
}

private extension TrainingsView {
    
    var title: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Text(Localizable.trainings)
                    .style(.roboto(.display1, .bold), .brand)
                    .padding(.leading, 10)
                
                Spacer(minLength: 10)
            }
            .frame(maxWidth: .infinity, height: Self.titleHeight)
            .background(Color.white)
            .addShadow(color: .white, radius: Self.titleShadowHeight, offset: 10)
            
            Spacer()
        }
    }
    
    @ViewBuilder
    var content: some View {
        if let error = viewModel.error {
            TrainingsErrorView()
        } else if viewModel.trainings.isEmpty {
            TrainingsEmptyView()
        } else {
            TrainingsContentView(trainings: viewModel.trainings, onTrainingCellTapped: viewModel.trainingCellTapped, onTrainingCellOptionsTapped: viewModel.trainingCellOptionsTapped)
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
        .addShadow()
        .padding(.trailing, 15)
        .onTapGesture {
            viewModel.showTrainingOptions()
        }
    }
}

struct TrainingsView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingsView(.mocked)
        
        TrainingsView(.mockedEmpty)
        
        TrainingsView(.mockedError)
    }
}
