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
        Text("Hello, Trainings!")
    }
    
    init(_ viewModel: TrainingsViewModel) {
        self.viewModel = viewModel
    }
}

struct TrainingsView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingsView(.init())
    }
}
