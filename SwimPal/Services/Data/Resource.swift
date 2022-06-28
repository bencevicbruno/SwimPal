//
//  Resource.swift
//  SwimPal
//
//  Created by Bruno Benčević on 27.06.2022..
//

import Foundation

struct Resource<T> where T: Codable {
    
    let params: [String: Any]?
    let paramsPartName: String
    let path: String
    let method: Resource.Method
    let encoding: Resource.Encoding
    
    init(
        params: [String: Any]? = nil,
        paramsPartName: String = "data",
        path: String,
        method: Resource.Method = .get,
        encoding: Resource.Encoding = .urlEncodedInUrl) {
            self.params = params
            self.paramsPartName = paramsPartName
            self.path = path
            self.method = method
            self.encoding = encoding
    }
    
//    func parse(_ anyData: Any) throws -> T {
//        let decoder = JSONDecoder()
//        let data = try JSONSerialization.data(withJSONObject: anyData, options: .prettyPrinted)
//        
//        return try decoder.decode(T.self, from: data)
//    }
}
