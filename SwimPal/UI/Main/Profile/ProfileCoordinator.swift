//
//  ProfileCoordinator.swift
//  SwimPal
//
//  Created by Bruno Benčević on 10.06.2022..
//

import SwiftUI

final class ProfileCoordinator: ObservableObject {
    
    var onGoToAuthorization: EmptyCallback?
    var onStartTraining: ((Training.Category) -> Void)?
    
    @Published var viewModel = ProfileViewModel()
    @Published var statisticsViewModel: StatisticsViewModel?
    @Published var achievementsViewModel: AchievementsViewModel?
    @Published var settingsViewModel: SettingsViewModel?
    @Published var aboutViewModel: AboutViewModel?
    
    init() {
        viewModel.onGoToStatistics = { [weak self] in
            self?.goToStatistics()
        }
        
        viewModel.onGoToAchievements = { [weak self] in
            self?.goToAchievements()
        }
        
        viewModel.onGoToSettings = { [weak self] in
            self?.goToSettings()
        }
        
        viewModel.onGoToAbout = { [weak self] in
            self?.goToAbout()
        }
        
        viewModel.onLoggedOut = { [weak self] in
            self?.onGoToAuthorization?()
        }
    }
    
    func goToStatistics() {
        statisticsViewModel = StatisticsViewModel()
        
        statisticsViewModel!.onDismissed = { [weak self] in
            self?.statisticsViewModel = nil
        }
    }
    
    func goToAchievements() {
        achievementsViewModel = AchievementsViewModel()
        
        achievementsViewModel!.onDismissed = { [weak self] in
            self?.achievementsViewModel = nil
        }
    }
    
    func goToSettings() {
        settingsViewModel = SettingsViewModel()
        
        settingsViewModel!.onDismissed = { [weak self] in
            self?.settingsViewModel = nil
        }
    }
    
    func goToAbout() {
        aboutViewModel = AboutViewModel()
        
        aboutViewModel!.onDismissed = { [weak self] in
            self?.aboutViewModel = nil
        }
    }
}

struct ProfileCoordinatorView: View {
    
    @ObservedObject var coordinator: ProfileCoordinator
    
    var body: some View {
        ProfileView(coordinator.viewModel)
            .push(item: $coordinator.statisticsViewModel) {
                StatisticsView(viewModel: $0)
            }
            .push(item: $coordinator.achievementsViewModel) {
                AchievementsView(viewModel: $0)
            }
            .push(item: $coordinator.settingsViewModel) {
                SettingsView(viewModel: $0)
            }
            .present(item: $coordinator.aboutViewModel) {
                AboutView(viewModel: $0)
                    .preferredColorScheme(.light)
            }
    }
    
    init(_ coordinator: ProfileCoordinator) {
        self.coordinator = coordinator
    }
}
