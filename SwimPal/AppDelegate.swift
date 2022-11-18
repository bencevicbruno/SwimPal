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
        ServiceContainer.register(type: DataServiceProtocol.self, DataService())
        ServiceContainer.register(type: FileManagerService.self, FileManagerService())
        ServiceContainer.register(type: AuthorizationServiceProtocol.self, as: .singleton, AuthorizationService())
        ServiceContainer.register(type: LocationService.self, LocationService())
        ServiceContainer.register(type: PersistenceServiceProtocol.self, as: .singleton, PersistenceService())
        ServiceContainer.register(type: TrainingsServiceProtocol.self, TestTrainingService())
        ServiceContainer.register(type: GeoNamesServiceProtocol.self, GeoNamesService())
    }
    
    func printFonts() {
        UIFont.familyNames.forEach { familyName in
            let fontNames = UIFont.fontNames(forFamilyName: familyName)
            print(familyName, fontNames)
        }
    }
}
