//
//  TrainingsCoordinator.swift
//  SwimPal
//
//  Created by Bruno Benčević on 30.05.2022..
//

import SwiftUI

final class TrainingsCoordinator: ObservableObject {
    
    @Published var viewModel = TrainingsViewModel()
    
    init() {
        
    }
}

struct TrainingsCoordinatorView: View {
    
    @ObservedObject var coordinator: TrainingsCoordinator
    
    var body: some View {
        TrainingsView(coordinator.viewModel)
    }
    
    init(_ coordinator: TrainingsCoordinator) {
        self.coordinator = coordinator
    }
}
