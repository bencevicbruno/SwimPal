//
//  FileManagerServiceError.swift
//  SwimPal
//
//  Created by Bruno Benčević on 03.07.2022..
//

import Foundation

enum FileManagerServiceError: Error {
    case fileNotFound
    case filesNotFound
    case dataCorrupted
    case cannotEncode
    case invalidURL
    case cannotCreatePath
    case cantSave
}
