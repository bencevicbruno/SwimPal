//
//  FileManager+.swift
//  SwimPal
//
//  Created by Bruno Benčević on 03.07.2022..
//

import Foundation

extension FileManager {
    
    var documentsDirectory: URL {
        self.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
}
