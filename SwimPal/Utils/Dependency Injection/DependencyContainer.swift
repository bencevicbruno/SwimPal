//
//  DependencyContainer.swift
//  SwimPal
//
//  Created by Bruno Benčević on 24.05.2022..
//

import Foundation

final class DependencyContainer {
    
    private static var factoryDict: [String: () -> Any] = [:]
    
    static func register<Service>(type: Service.Type, _ factory: @autoclosure @escaping () -> Service) {
        factoryDict[String(describing: type.self)] = factory
    }
    
    static func resolve<Service>(_ type: Service.Type) -> Service? {
        return factoryDict[String(describing: type.self)]?() as? Service
    }
}
