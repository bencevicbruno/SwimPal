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
            NavigationBar(Localizable.title_statistics, onBackTapped: viewModel.dismiss)
            
            WIPScreen(title: Localizable.wip_statistics_title, message: Localizable.wip_statistics_message, illustrationName: "illustration_noStatistics")
                
        }
        .setupView()
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView(viewModel: .init())
    }
}
