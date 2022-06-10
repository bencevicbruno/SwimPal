//
//  SwimPalApp.swift
//  SwimPal
//
//  Created by Bruno Benčević on 24.05.2022..
//

import SwiftUI

@main
struct SwimPalApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            RootCoordinatorView()
        }
    }
}
