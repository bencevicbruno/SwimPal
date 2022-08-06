//
//  RefreshToken.swift
//  SwimPal
//
//  Created by Bruno Benčević on 04.08.2022..
//

import Foundation

class RefreshToken: ObservableObject {
    
    static let instance: RefreshToken = .init()
    static let tabGeneral: RefreshToken = .init()
    
    @Published private(set) var token = false
    
    private init() {}
    
    func refresh() {
        token.toggle()
    }
}
