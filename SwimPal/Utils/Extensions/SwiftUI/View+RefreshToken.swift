//
//  View+RefreshToken.swift
//  SwimPal
//
//  Created by Bruno Benčević on 01.08.2022..
//

import SwiftUI

extension View {
    
    func refreshToken(_ token: RefreshToken) -> some View {
        self.id(token ? UUID() : UUID())
    }
}
