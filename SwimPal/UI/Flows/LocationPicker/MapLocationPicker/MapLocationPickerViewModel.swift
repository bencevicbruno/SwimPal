//
//  MapLocationPickerViewModel.swift
//  SwimPal
//
//  Created by Bruno Benčević on 12.07.2022..
//

import Combine
import SwiftUI
import MapKit

final class MapLocationPickerViewModel: ObservableObject {
    
    var onDismissed: EmptyCallback?
    var onExit: EmptyCallback?
    
    @Published var userLocation: CLLocationCoordinate2D = .init()
    @Published var region: MKCoordinateRegion!
    
    @Dependency var locationService: LocationService
    
    var locationCancellable: AnyCancellable?
    
    init() {
        region = .init(center: locationService.currentLocation, span: .init(latitudeDelta: 0.001, longitudeDelta: 0.001))
        
        locationCancellable = locationService.$currentLocation.sink { [weak self] newLocation in
            self?.userLocation = newLocation
        }
    }
    
    func dismiss() {
        onDismissed?()
    }
    
    func exit() {
        onExit?()
    }
}
