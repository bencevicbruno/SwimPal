//
//  TrainingSummaryView.swift
//  SwimPal
//
//  Created by Bruno Benčević on 28.06.2022..
//

import SwiftUI

struct TrainingSummaryView: View {
    
    @ObservedObject var viewModel: TrainingSummaryViewModel
    
    var body: some View {
        NavigationBar("Training Summary", onBackTapped: viewModel.dismiss)
            .removeNavigationBar()
    }
}

struct TrainingSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingSummaryView(viewModel: .init())
    }
}
