//
//  CaseIterable+.swift
//  SwimPal
//
//  Created by Bruno Benčević on 26.07.2022..
//

import Foundation

extension CaseIterable {
    
    static var randomCase: Self {
        allCases.randomElement()!
    }
}
