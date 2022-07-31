//
//  Date+.swift
//  SwimPal
//
//  Created by Bruno Benčević on 22.07.2022..
//

import Foundation

extension Date {
    
    func formatted(as format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        
        return formatter.string(from: self)
    }
}
