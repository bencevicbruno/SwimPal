//
//  LocalUser.swift
//  SwimPal
//
//  Created by Bruno Benčević on 24.05.2022..
//

import Foundation

struct UserData: Identifiable, Codable {
    let id: String
    var name: String
    var email: String
    var avatarURL: URL?
    
    init(id: String? = nil, name: String, email: String, avatarURL: URL? = nil) {
        self.id = Self.createUUID(id: id).uuidString
        self.name = name
        self.email = email
        self.avatarURL = avatarURL
    }
    
    static func createUUID(id: String?) -> UUID {
        if let id = id {
            return UUID(uuidString: id) ?? UUID()
        }
        
        return UUID()
    }
}
