//
//  LocationService.swift
//  SwimPal
//
//  Created by Bruno Benčević on 02.07.2022..
//

import Foundation
import CoreLocation

final class LocationService: NSObject {
    
    private let locationManager = CLLocationManager()
    private var lastKnownLocation: CLLocationCoordinate2D?
    
    private var locationConsumer: [LocationCallback] = []
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func fetchLocation(_ callback: @escaping LocationCallback) {
        if let location = lastKnownLocation {
            callback(location)
        } else {
            locationConsumer.append(callback)
        }
    }
}

extension LocationService: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first?.coordinate {
            lastKnownLocation = location
            
            locationConsumer.forEach {
                $0(location)
            }
            
            locationConsumer.removeAll()
        }
    }
}
