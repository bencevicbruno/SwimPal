//
//  DataServiceProtocol.swift
//  SwimPal
//
//  Created by Bruno Benčević on 06.08.2022..
//

import Foundation

protocol DataServiceProtocol {
    
    var runCompletionOnMainThread: Bool { get set }
    
    func fetch<T>(from urlString: String, completion: @escaping (Result<T, Error>) -> Void) where T: Decodable
}
