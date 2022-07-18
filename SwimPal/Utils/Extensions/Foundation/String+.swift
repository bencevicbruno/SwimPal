//
//  String+.swift
//  SwimPal
//
//  Created by Bruno Benčević on 03.07.2022..
//

import Foundation

extension String {
    
    func substringUntilLast(_ char: Character) -> String {
        guard let index = self.lastIndex(of: char) else { return self }
        
        return String(self[..<index])
    }
    
    var urlSafe: String {
        self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? self
    }
}
