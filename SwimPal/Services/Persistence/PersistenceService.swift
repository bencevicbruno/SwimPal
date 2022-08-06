//
//  PersistenceService.swift
//  SwimPal
//
//  Created by Bruno Benčević on 24.05.2022..
//

import Foundation

final class PersistenceService: PersistenceServiceProtocol {
    
    var language: Language {
        get {
            UserDefaults.standard.load(.language) ?? .english
        }
        set {
            UserDefaults.standard.save(newValue, .language)
        }
    }
    
    var unitSystem: UnitSystem {
        get {
            UserDefaults.standard.load(.unitSystem) ?? .metric
        } set {
            UserDefaults.standard.save(newValue, .unitSystem)
        }
    }
    
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
