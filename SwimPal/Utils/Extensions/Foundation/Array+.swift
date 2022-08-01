//
//  Array+.swift
//  SwimPal
//
//  Created by Bruno Benčević on 01.08.2022..
//

import Foundation

extension Array where Element: Hashable {
    
    var frequencyOfUniqueElements: Dictionary<Element, Int> {
        Dictionary(self.map { ($0, 1) }, uniquingKeysWith: +)
    }
}
