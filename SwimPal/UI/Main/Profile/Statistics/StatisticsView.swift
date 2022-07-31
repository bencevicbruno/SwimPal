//
//  StatisticsView.swift
//  SwimPal
//
//  Created by Bruno Benčević on 11.06.2022..
//

import SwiftUI

struct StatisticsView: View {
    
    @ObservedObject var viewModel: StatisticsViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            NavigationBar("Statistics", onBackTapped: viewModel.dismiss)
            
            emptyStateContent
                
        }
        .removeNavigationBar()
        .background(Color.white)
        .trainingSelectionSheet($viewModel.trainingSelectionData)
    }
}

private extension StatisticsView {
    
    var emptyStateContent: some View {
        EmptyStateScreen(.init(title: Localizable.no_statistics, message: Localizable.no_statistics_msg, illustrationName: "illustration_noStatistics", actionTitle: Localizable.start_training, action: viewModel.showTrainingSelection))
            .padding(10)
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView(viewModel: .init())
    }
}
