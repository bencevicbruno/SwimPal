//
//  LocationService.swift
//  SwimPal
//
//  Created by Bruno Benčević on 02.07.2022..
//

import Foundation
import CoreLocation

final class LocationService: NSObject {
    
    @Published var currentLocation: CLLocationCoordinate2D = .init()
    
    let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
    
}

extension LocationService: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first?.coordinate {
            currentLocation = location
        }
    }
}
