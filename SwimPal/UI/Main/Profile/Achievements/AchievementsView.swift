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
            
            WIPScreen(title: "Work in progress", message: "I guess the whole summer wasn't enough to develop an achievement system.", illustrationName: "illustration_noAchievements")
        }
        .setupView()
    }
}

struct AchievementsView_Previews: PreviewProvider {
    static var previews: some View {
        AchievementsView(viewModel: .init())
    }
}
