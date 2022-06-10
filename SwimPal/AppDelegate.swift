//
//  AppDelegate.swift
//  SwimPal
//
//  Created by Bruno Benčević on 02.06.2022..
//

import Foundation
import UIKit

final class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        setupDependencyContainer()
        
        return true
    }
}

private extension AppDelegate {
    
    func setupDependencyContainer() {
        DependencyContainer.register(type: PersistenceServiceProtocol.self, PersistenceService())
    }
}
