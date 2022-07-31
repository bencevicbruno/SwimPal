//
//  HomeCoordinator.swift
//  SwimPal
//
//  Created by Bruno Benčević on 30.05.2022..
//

import SwiftUI

final class HomeCoordinator: ObservableObject {
    
    @Published var viewModel = HomeViewModel()
    @Published var activeTrainingCoordinator: ActiveTrainingCoordinator?
    @Published var trainingSummaryCoordinator: TrainingSummaryCoordinator?
    
    init() {
        viewModel.onGoToTrainingPreparation = { [weak self] category in
            self?.goToTrainingPreparation(for: category)
        }
    }
    
    func goToTrainingPreparation(for category: Training.Category) {
        activeTrainingCoordinator = ActiveTrainingCoordinator(category: category)
        
        activeTrainingCoordinator!.onDismissed = { [weak self] in
            self?.activeTrainingCoordinator = nil
        }
        
        activeTrainingCoordinator!.onTrainingSaved = { [weak self] training in
            self?.activeTrainingCoordinator = nil
            self?.goToTrainingSummary(training: training)
        }
    }
    
    func goToTrainingSummary(training: Training) {
        trainingSummaryCoordinator = TrainingSummaryCoordinator(training: training)
        
        trainingSummaryCoordinator!.onDismissed = { [weak self] in
            self?.trainingSummaryCoordinator = nil
        }
    }
}

struct HomeCoordinatorView: View {
    
    @ObservedObject var coordinator: HomeCoordinator
    
    var body: some View {
        HomeView(coordinator.viewModel)
            .presentNavigation(item: $coordinator.activeTrainingCoordinator) {
                ActiveTrainingCoordinatorView(coordinator: $0)
            }
            .pushNavigation(item: $coordinator.trainingSummaryCoordinator) {
                TrainingSummaryCoordinatorView(coordinator: $0)
            }
    }
    
    init(_ coordinator: HomeCoordinator) {
        self.coordinator = coordinator
    }
}
