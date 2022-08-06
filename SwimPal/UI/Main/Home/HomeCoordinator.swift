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
        
        activeTrainingCoordinator!.onTrainingSaved = { [weak self] id in
            self?.goToTrainingSummary(id: id)
        }
    }
    
    func goToTrainingSummary(id: UUID) {
        trainingSummaryCoordinator = TrainingSummaryCoordinator(trainingID: id)
        
        trainingSummaryCoordinator!.onDismissed = { [weak self] in
            self?.trainingSummaryCoordinator = nil
        }
    }
}

struct HomeCoordinatorView: View {
    
    @ObservedObject var coordinator: HomeCoordinator
    
    var body: some View {
        HomeView(coordinator.viewModel)
            .present(item: $coordinator.activeTrainingCoordinator) {
                ActiveTrainingCoordinatorView(coordinator: $0)
            }
            .push(item: $coordinator.trainingSummaryCoordinator) {
                TrainingSummaryCoordinatorView(coordinator: $0)
            }
    }
    
    init(_ coordinator: HomeCoordinator) {
        self.coordinator = coordinator
    }
}
