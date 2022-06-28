//
//  RequestInterceptor.swift
//  SwimPal
//
//  Created by Bruno Benčević on 27.06.2022..
//

import Foundation

protocol RequestInterceptor {
    
    var headers: [String: String]? { get set }
    
//    func intercept(_ request: DataRequest) -> DataRequest
}
