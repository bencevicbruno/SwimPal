//
//  DataServiceProtocol.swift
//  SwimPal
//
//  Created by Bruno Benčević on 27.06.2022..
//

import Foundation

protocol DataServiceProtocol {
    
    func fetch<T>(_ resource: Resource<T>) async throws -> T
    
}
