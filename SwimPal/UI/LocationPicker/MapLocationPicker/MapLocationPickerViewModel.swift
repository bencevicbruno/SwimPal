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
    var onDismissedAll: EmptyCallback?
    var onLocationPicked: ((Training.Location) -> Void)?
    
    @Published var userLocation: CLLocationCoordinate2D = .init()
    @Published var region: MKCoordinateRegion = .init(center: .init(), span: .init(latitudeDelta: 0.001, longitudeDelta: 0.001))
    
    @Published var fieldInputData: FieldInputData?
    
    @Service var locationService: LocationService
    
    init() {
        locationService.fetchLocation { [weak self] location in
            self?.userLocation = location
            self?.region = .init(center: location, span: .init(latitudeDelta: 0.001, longitudeDelta: 0.001))
        }
    }
    
    func dismiss() {
        onDismissed?()
    }
    
    func dismissAll() {
        onDismissedAll?()
    }
    
    func selectTapped() {
        fieldInputData = .init(title: Localizable.insert_location_name, validators: [TextFieldValidator.length(30)]) { [weak self] locationName in
            guard let self = self else { return }
            self.onLocationPicked?(.init(latitude: self.region.center.latitude, longitude: self.region.center.longitude, name: locationName))
        }
    }
}
