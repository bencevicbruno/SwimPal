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

func debugError(_ message: String, _ error: Error? = nil, _ file: String = #file, _ function: String = #function) {
    let fileName: String
    
    if let lastSlashIndex = file.lastIndex(of: "/") {
        fileName = String(file.suffix(from: file.index(lastSlashIndex, offsetBy: 1)))
    } else {
        fileName = file
    }
    
    if let error = error {
        print("[ERROR @\(fileName)#\(function)]: \(error) -> \(message)")
    } else {
        print("[ERROR @\(fileName)#\(function)]: \(message)")
    }
}

func onMain(_ completion: @escaping EmptyCallback) {
    DispatchQueue.main.async {
        completion()
    }
}

func inBackground(_ completion: @escaping EmptyCallback) {
    DispatchQueue.global(qos: .background).async {
        completion()
    }
}
