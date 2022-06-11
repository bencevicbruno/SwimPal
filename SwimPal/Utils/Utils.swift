//
//  Utils.swift
//  SwimPal
//
//  Created by Bruno Benčević on 11.06.2022..
//

import Foundation

func debug(_ message: String, _ file: String = #file, _ function: String = #function) {
    let fileName: String
    
    if let lastSlashIndex = file.lastIndex(of: "/") {
        fileName = String(file.suffix(from: file.index(lastSlashIndex, offsetBy: 1)))
    } else {
        fileName = file
    }
    
    print("[\(fileName)#\(function)]: \(message)")
}

func debugError(_ message: String, _ file: String = #file, _ function: String = #function) {
    let fileName: String
    
    if let lastSlashIndex = file.lastIndex(of: "/") {
        fileName = String(file.suffix(from: file.index(lastSlashIndex, offsetBy: 1)))
    } else {
        fileName = file
    }
    
    print("[ERROR @\(fileName)#\(function)]: \(message)")
}
