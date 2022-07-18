//
//  LocationPickerViewModel.swift
//  SwimPal
//
//  Created by Bruno Benčević on 12.07.2022..
//

import Foundation

final class LocationPickerViewModel: ObservableObject {
    
    var onDismissed: EmptyCallback?
    var onGoToMapLocationPicker: EmptyCallback?
    
    @Published var results: [String]?
    @Published var error: ErrorData?
    @Published var isActivityRunning = false
    
    init() {
        
    }
    
    func dismiss() {
        onDismissed?()
    }
    
    func goToMapLocationPicker() {
        onGoToMapLocationPicker?()
    }
}
