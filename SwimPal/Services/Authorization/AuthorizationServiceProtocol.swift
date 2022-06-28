//
//  AuthorizationServiceProtocol.swift
//  SwimPal
//
//  Created by Bruno Benčević on 27.06.2022..
//

import Foundation

protocol AuthorizationServiceProtocol {
    
    var onError: ErrorCallback? { get set}
    
    func login(onSuccess: ((UserData) -> Void)?)
    func logout()
}
