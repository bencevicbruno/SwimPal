//
//  LocalUser.swift
//  SwimPal
//
//  Created by Bruno Benčević on 24.05.2022..
//

import Foundation

struct UserData: Identifiable, Codable {
    let id: UUID
    var name: String
    var lastName: String
    var email: String
    
    init(name: String, lastName: String, email: String) {
        id = UUID()
        self.name = name
        self.lastName = lastName
        self.email = email
    }
}
