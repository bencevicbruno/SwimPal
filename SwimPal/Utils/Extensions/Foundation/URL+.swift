//
//  URL+.swift
//  SwimPal
//
//  Created by Bruno Benčević on 03.08.2022..
//

import Foundation

extension URL {

    func access() {
        let _ = startAccessingSecurityScopedResource()
    }
    
    func stopAccess() {
        let _ = stopAccessingSecurityScopedResource()
    }
}
