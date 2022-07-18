//
//  Resource.swift
//  SwimPal
//
//  Created by Bruno Benčević on 27.06.2022..
//

import Foundation

struct Resource<T> where T: Codable {
    
    let path: String
    let params: [String: Any]?
    let method: HTTPMethod
    let encoding: ResourceEncoding
    
    init(
        path: String,
        params: [String: Any]? = nil,
        method: HTTPMethod = .get,
        encoding: ResourceEncoding = .urlEncoded) {
            self.params = params
            self.path = path
            self.method = method
            self.encoding = encoding
    }
}
