//
//  UserDefaults+.swift
//  SwimPal
//
//  Created by Bruno Benčević on 24.05.2022..
//

import Foundation

extension UserDefaults {
 
    func load<T>(_ key: PersistenceKey) -> T? where T: Decodable {
        guard let data = self.object(forKey: "\(key)") as? Data else {
            debug("Unable to load \(key).")
            return nil
        }
        
        guard let t = try? JSONDecoder().decode(T.self, from: data) else {
            debug("Unable to decode \(key).")
            return nil
        }
        
        debug("Successfully loaded \(key).")
        return t
    }
    
    func save<T>(_ t: T, _ key: PersistenceKey) where T: Encodable {
        guard let data = try? JSONEncoder().encode(t) else {
            debug("Unable to encode \(key).");
            return
        }
        
        self.set(data, forKey: "\(key)")
        debug("Sucessfully saved \(key).")
    }
}
