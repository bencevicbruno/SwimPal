//
//  DependencyPropertyWrapper.swift
//  SwimPal
//
//  Created by Bruno Benčević on 24.05.2022..
//

import Foundation

@propertyWrapper
struct Dependency<Service> {
    var service: Service
    
    init() {
        guard let service = DependencyContainer.resolve(Service.self) else {
            fatalError("No dependency of type \(String(describing: Service.self)) registered!")
        }
        
        self.service = service
    }
    
    var wrappedValue: Service {
        get { self.service }
        mutating set { service = newValue }
    }
}
