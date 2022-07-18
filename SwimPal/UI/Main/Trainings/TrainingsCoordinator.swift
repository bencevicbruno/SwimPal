//
//  TrainingsCoordinator.swift
//  SwimPal
//
//  Created by Bruno Benčević on 30.05.2022..
//

import SwiftUI

final class TrainingsCoordinator: ObservableObject {
    
    @Published var viewModel = TrainingsViewModel()
    @Published var activeTrainingCoordinator: ActiveTrainingCoordinator?
    @Published var trainingSummaryCoordinator: TrainingSummaryCoordinator?
    
    init() {
        viewModel.onGoToStartTraining = { [weak self] category in
            self?.startTraining(category: category)
        }
        
        viewModel.onGoToTrainingSummary = { [weak self] in
            self?.goToTrainingSummary()
        }
    }
    
    func startTraining(category: Training.Category) {
        activeTrainingCoordinator = ActiveTrainingCoordinator(category: category)
        
        activeTrainingCoordinator!.onDismissed = { [weak self] in
            self?.activeTrainingCoordinator = nil
        }
        
        activeTrainingCoordinator?.onTrainingSaved = { [weak self] in
            self?.activeTrainingCoordinator = nil
            self?.goToTrainingSummary()
        }
    }
    
    func goToTrainingSummary() {
        trainingSummaryCoordinator = TrainingSummaryCoordinator()
        
        trainingSummaryCoordinator!.onDismissed = { [weak self] in
            self?.trainingSummaryCoordinator = nil
        }
    }
}

struct TrainingsCoordinatorView: View {
    
    @ObservedObject var coordinator: TrainingsCoordinator
    
    var body: some View {
        TrainingsView(coordinator.viewModel)
            .presentNavigation(item: $coordinator.activeTrainingCoordinator) {
                ActiveTrainingCoordinatorView(coordinator: $0)
            }
            .pushNavigation(item: $coordinator.trainingSummaryCoordinator) {
                TrainingSummaryCoordinatorView(coordinator: $0)
            }
    }
    
    init(_ coordinator: TrainingsCoordinator) {
        self.coordinator = coordinator
    }
}
