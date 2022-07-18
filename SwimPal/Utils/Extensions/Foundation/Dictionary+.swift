//
//  Dictionary+.swift
//  SwimPal
//
//  Created by Bruno Benčević on 12.07.2022..
//

import Foundation

extension Dictionary where Key == String {
 
    var encodedAsURLParameters: String {
        self.map { (key, value) in
            "\(key.urlSafe)=\("\(value)".urlSafe)"
        }.joined(separator: "&")
    }
}
