//
//  String?+.swift
//  SwimPal
//
//  Created by Bruno Benčević on 04.08.2022..
//

import Foundation

extension Optional where Wrapped == String {
    
    var nilIfEmpty: String? {
        if self?.isEmpty ?? false {
            return nil
        } else {
            return self
        }
    }
}
