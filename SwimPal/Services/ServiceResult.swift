//
//  ServiceResult.swift
//  SwimPal
//
//  Created by Bruno Benčević on 03.07.2022..
//

import Foundation

enum ServiceResult<T> {
    case success(T)
    case failure(Error)
}
