//
//  DataServiceResult.swift
//  SwimPal
//
//  Created by Bruno Benčević on 12.07.2022..
//

import Foundation

enum DataServiceResult<T> {
    case success(T)
    case failure(DataServiceError)
}

//enum DataServiceError: Error {
//    case validationEror
//    case cannotParse
//    case noInternet
//    case other(Error)
//}
