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
            
            WIPScreen(title: "Time goes by...\nSo slowly...", message: "Let's wait until Apple releases iOS 16 so we can use SwiftUI charts, shall we?", illustrationName: "illustration_noStatistics")
                
        }
        .setupView()
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView(viewModel: .init())
    }
}
