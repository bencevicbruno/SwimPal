//
//  RequestInterceptor.swift
//  SwimPal
//
//  Created by Bruno Benčević on 27.06.2022..
//

import Foundation

protocol RequestProtocol {
    associatedtype T where T: Encodable
    var path: String { get }
    var headers: [String: String] { get }
    var parameters: [String: String] { get }
    var httpMethood: HTTPMethod { get }
    var resourceEncoding: ResourceEncoding { get }
    var body: T? { get set }
}



protocol RequestInterceptorProtocol {
    
    func intercept(_ request: inout URLRequest)
}
