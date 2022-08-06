//
//  DependencyContainer.swift
//  SwimPal
//
//  Created by Bruno Benčević on 24.05.2022..
//

import Foundation

final class DependencyContainer {
    
    private static var cache: [String: Any] = [:]
    private static var factoryDict: [String: () -> Any] = [:]
    
    static func register<Service>(type: Service.Type, _ factory: @autoclosure @escaping () -> Service) {
        factoryDict[String(describing: type.self)] = factory
    }
    
    static func resolve<Service>(dependencyType: DependencyType, _ type: Service.Type) -> Service? {
        switch dependencyType {
        case .singleton:
            if let cachedService = cache[String(describing: type.self)] as? Service {
                return cachedService
            }
            fallthrough
        case .new:
            if let service = factoryDict[String(describing: type.self)]?() as? Service{
                cache[String(describing: type.self)] = service
                return service
            } else {
                return nil
            }
        }
    }
}
