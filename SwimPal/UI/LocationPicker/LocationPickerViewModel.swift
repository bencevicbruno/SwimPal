//
//  LocationPickerViewModel.swift
//  SwimPal
//
//  Created by Bruno Benčević on 12.07.2022..
//

import Combine
import SwiftUI

final class LocationPickerViewModel: ObservableObject {
    
    var onDismissed: EmptyCallback?
    var onLocationPicked: ((Training.Location) -> Void)?
    var onGoToMapLocationPicker: EmptyCallback?
    
    @Published var searchText = ""
    @Published var results: [String] = []
    @Published var isActivityRunning = false
    
    @Service private var geoNamesService: GeoNamesServiceProtocol
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
       setupCancellables()
    }
}

// MARK: - User Interacitons
extension LocationPickerViewModel {
    
    func dismiss() {
        onDismissed?()
    }
    
    func resultTapped(_ result: String) {
        onLocationPicked?(.init(name: result))
    }
    
    func searchOnMapTapped() {
        onGoToMapLocationPicker?()
    }
}

private extension LocationPickerViewModel {
    
    private func setupCancellables() {
        self.$searchText
            .debounce(for: .seconds(1), scheduler: RunLoop.main)
            .sink { [weak self] newValue in
                guard !newValue.isEmpty,
                      let self = self else { return }
                
                self.cancellables.removeAll()
                self.fetchCities(prefixedWith: newValue)
            }
            .store(in: &cancellables)
    }
    
    private func fetchCities(prefixedWith prefix: String) {
        isActivityRunning = true
        
        geoNamesService.fetchCities(prefixedWith: prefix) { [weak self] result in
            guard let self = self else { return }
            self.isActivityRunning = false
            
            switch result {
            case .success(let response):
                self.results = response.locations
            case .failure(let error):
                self.results = []
                print("Failed due to\(error)")
            }
        }
    }
}
