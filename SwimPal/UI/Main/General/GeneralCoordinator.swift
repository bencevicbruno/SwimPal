//
//  Generaloordinator.swift
//  SwimPal
//
//  Created by Bruno Benčević on 10.06.2022..
//

import SwiftUI

final class GeneralCoordinator: ObservableObject {
    
    var onGoToAuthorization: EmptyCallback?
    var onStartTraining: ((Training.Category) -> Void)?
    
    @Published var viewModel = GeneralViewModel()
    @Published var statisticsViewModel: StatisticsViewModel?
    @Published var achievementsViewModel: AchievementsViewModel?
    @Published var settingsViewModel: SettingsViewModel?
    @Published var onboardingCoordinator: OnboardingCoordinator?
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
        
        viewModel.onGoToOnboarding = { [weak self] in
            self?.goToOnboarding()
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
            RefreshToken.tabGeneral.refresh()
            self?.settingsViewModel = nil
        }
    }
    
    func goToOnboarding() {
        onboardingCoordinator = OnboardingCoordinator(.fromAbout)
        
        onboardingCoordinator!.onDismissed = { [weak self] in
            self?.onboardingCoordinator = nil
        }
    }
    
    func goToAbout() {
        aboutViewModel = AboutViewModel()
        
        aboutViewModel!.onDismissed = { [weak self] in
            self?.aboutViewModel = nil
        }
    }
}

struct GeneralCoordinatorView: View {
    
    @ObservedObject var coordinator: GeneralCoordinator
    
    var body: some View {
        GeneralView(coordinator.viewModel)
            .push(item: $coordinator.statisticsViewModel) {
                StatisticsView(viewModel: $0)
            }
            .push(item: $coordinator.achievementsViewModel) {
                AchievementsView(viewModel: $0)
            }
            .push(item: $coordinator.settingsViewModel) {
                SettingsView(viewModel: $0)
            }
            .present(item: $coordinator.onboardingCoordinator) {
                OnboardingCoordinatorView($0)
                    .preferredColorScheme(.light)
            }
            .present(item: $coordinator.aboutViewModel) {
                AboutView(viewModel: $0)
                    .preferredColorScheme(.light)
            }
    }
    
    init(_ coordinator: GeneralCoordinator) {
        self.coordinator = coordinator
    }
}
