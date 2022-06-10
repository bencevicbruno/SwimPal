//
//  PersistenceService.swift
//  SwimPal
//
//  Created by Bruno Benčević on 24.05.2022..
//

import Foundation

final class PersistenceService: PersistenceServiceProtocol {
    
    var didShowOnboarding: Bool {
        get {
            UserDefaults.standard.load(.didShowOnboarding) ?? false
        }
        set {
            UserDefaults.standard.save(newValue, .didShowOnboarding)
        }
    }
    
    var user: UserData? {
        get {
            UserDefaults.standard.load(.userData)
        }
        set {
            UserDefaults.standard.save(newValue, .userData)
        }
    }
}
