//
//  AchievementsView.swift
//  SwimPal
//
//  Created by Bruno Benčević on 11.06.2022..
//

import SwiftUI

struct AchievementsView: View {
    
    @ObservedObject var viewModel: AchievementsViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            NavigationBar(Localizable.achievements, onBackTapped: viewModel.dismiss)
            
            emptyStateContent
        }
        .removeNavigationBar()
        .background(.white)
        .trainingSelectionSheet($viewModel.trainingSelectionData)
    }
}

private extension AchievementsView {
    
    var emptyStateContent: some View {
        EmptyStateScreen(.init(title: Localizable.no_achievements, message: Localizable.no_achievements_msg, illustrationName: "illustration_noAchievements", actionTitle: Localizable.start_training, action: viewModel.showTrainingSelection))
    }
}

struct AchievementsView_Previews: PreviewProvider {
    static var previews: some View {
        AchievementsView(viewModel: .init())
    }
}
