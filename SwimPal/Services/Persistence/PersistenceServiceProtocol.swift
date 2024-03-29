//
//  PersistenceServiceProtocol.swift
//  SwimPal
//
//  Created by Bruno Benčević on 24.05.2022..
//

import Foundation

protocol PersistenceServiceProtocol {
    
    var language: Language { get set }
    var unitSystem: UnitSystem { get set }
    var didShowOnboarding: Bool { get set }
    var user: UserData? { get set }
}
