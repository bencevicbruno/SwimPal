//
//  AppDelegate.swift
//  SwimPal
//
//  Created by Bruno Benčević on 02.06.2022..
//

import UIKit
import FirebaseCore
import GoogleSignIn

final class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        setupDependencyContainer()
//        printFonts()
        
        FirebaseApp.configure()
        
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return GIDSignIn.sharedInstance.handle(url)
    }
}

private extension AppDelegate {
    
    func setupDependencyContainer() {
        DependencyContainer.register(type: AuthorizationServiceProtocol.self, AuthorizationService())
        DependencyContainer.register(type: DatabaseServiceProtocol.self, LocalDatabaseService())
        DependencyContainer.register(type: FileManagerService.self, FileManagerService())
        DependencyContainer.register(type: LocationService.self, LocationService())
        DependencyContainer.register(type: PersistenceServiceProtocol.self, PersistenceService())
    }
    
    func printFonts() {
        UIFont.familyNames.forEach({ familyName in
                    let fontNames = UIFont.fontNames(forFamilyName: familyName)
                    print(familyName, fontNames)
                })
    }
}
