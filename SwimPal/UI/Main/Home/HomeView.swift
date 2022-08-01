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
        ZStack(alignment: .top) {
            content
                .padding(.top, MainTitle.totalHeight)
            
            MainTitle("Hello, \(viewModel.userName)!")
        }
        .setupView()
    }
    
    init(_ viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
}

private extension HomeView {
    
    var content: some View {
        ScrollView(.vertical) {
            LazyVStack(alignment: .leading, spacing: 0) {
               MotivationCard(motivation: viewModel.motivations[viewModel.currentMotivationIndex])
                    .addShadow(.small)
                
                startTrainingTitle
                    .padding(.vertical, 12)
                
                TrainingSelection(withShadows: true, onCategorySelected: viewModel.goToTrainingPreparation)
                
                Spacer(minLength: MainTabBar.height + UIScreen.bottomUnsafePadding)
            }
            .padding(10)
        }
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
