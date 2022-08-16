//
//  GeoNamesServiceProtocol.swift
//  SwimPal
//
//  Created by Bruno Benčević on 06.08.2022..
//

import Foundation

protocol GeoNamesServiceProtocol {
    
    func fetchCities(prefixedWith prefix: String, completion: @escaping (Result<GeoNamesResponse, Error>) -> Void)
}
