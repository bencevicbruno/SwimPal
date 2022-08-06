//
//  LocationPickerViewModel.swift
//  SwimPal
//
//  Created by Bruno Benčević on 12.07.2022..
//

import SwiftUI

final class LocationPickerViewModel: ObservableObject {
    
    var onDismissed: EmptyCallback?
    var onGoToMapLocationPicker: EmptyCallback?
    
    @Published var searchText = ""
    @Published var results: [String] = []
    @Published var isActivityRunning = false
    
    init() {
        
    }
}

// MARK: - User Interacitons
extension LocationPickerViewModel {
    
    func dismiss() {
        onDismissed?()
    }
    
    func resultTapped(_ result: String) {
        
    }
    
    func searchOnMapTapped() {
        onGoToMapLocationPicker?()
    }
}
