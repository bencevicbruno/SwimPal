//
//  HomeView.swift
//  SwimPal
//
//  Created by Bruno Benčević on 02.06.2022..
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(alignment: .leading, spacing: 0) {
                greetingTitle
                    .padding(.bottom, 10)
                
                MotivationCard(motivation: viewModel.motivations[viewModel.currentMotivationIndex])
                
                startTrainingTitle
                    .padding(.vertical, 12)
                
                TrainingSelection(onCategorySelected: viewModel.goToTrainingPreparation)
                
                Spacer(minLength: MainTabBar.height)
            }
            .padding(10)
        }
        .removeNavigationBar()
        .background(.white)
    }
    
    init(_ viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
}

private extension HomeView {
    
    var greetingTitle: some View {
        Text("Hello, \(viewModel.userName)!")
            .style(.roboto(.display1, .bold), .brand, .leading)
    }
    
    var startTrainingTitle: some View {
        Text(Localizable.start_training)
            .style(.roboto(.headline1, .bold), .brand, .leading)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(.init())
    }
}
