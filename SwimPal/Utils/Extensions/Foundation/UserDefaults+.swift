//
//  UserDefaults+.swift
//  SwimPal
//
//  Created by Bruno Benčević on 24.05.2022..
//

import Foundation

extension UserDefaults {
 
    func load<T>(_ key: PersistenceKey) -> T? where T: Decodable {
        guard let data = self.object(forKey: "\(key)") as? Data else { return nil }
        
        return try? JSONDecoder().decode(T.self, from: data)
    }
    
    func save<T>(_ t: T, _ key: PersistenceKey) where T: Encodable {
        guard let data = try? JSONEncoder().encode(t) else { return }
        
        self.set(data, forKey: "\(key)")
    }
}
