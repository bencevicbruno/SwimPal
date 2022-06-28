//
//  AuthorizationServiceError.swift
//  SwimPal
//
//  Created by Bruno Benčević on 27.06.2022..
//

import Foundation

enum AuthorizationServiceError: Error {
    case missingUserData
    case other(Error)
}
