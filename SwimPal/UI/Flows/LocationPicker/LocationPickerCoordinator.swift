//
//  LocationPickerCoordinator.swift
//  SwimPal
//
//  Created by Bruno Benčević on 12.07.2022..
//

import SwiftUI

final class LocationPickerCoordinator: ObservableObject {
    
    var onDismissed: ((Training.Location?) -> Void)?
    
    @Published var viewModel = LocationPickerViewModel()
    @Published var mapLocationPickerViewModel: MapLocationPickerViewModel?
    
    init() {
        viewModel.onDismissed = { [weak self] in
            self?.dismiss()
        }
        
        viewModel.onGoToMapLocationPicker = { [weak self] in
            self?.goToMapLocationPicker()
        }
    }
    
    func goToMapLocationPicker() {
        mapLocationPickerViewModel = MapLocationPickerViewModel()
        
        mapLocationPickerViewModel!.onDismissed = { [weak self] in
            self?.mapLocationPickerViewModel = nil
        }
        
        mapLocationPickerViewModel!.onExit = { [weak self] newLocation in
            self?.dismiss(location: newLocation)
            self?.mapLocationPickerViewModel = nil
        }
    }
    
    func dismiss(location: Training.Location? = nil) {
        onDismissed?(location)
    }
}

struct LocationPickerCoordinatorView: View {
    
    @ObservedObject var coordinator: LocationPickerCoordinator
    
    var body: some View {
        NavigationView {
            LocationPickerView(viewModel: coordinator.viewModel)
                .presentNavigation(item: $coordinator.mapLocationPickerViewModel) {
                    MapLocationPickerView(viewModel: $0)
                }
        }
    }
}
