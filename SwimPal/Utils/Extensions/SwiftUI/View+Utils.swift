//
//  View+Utils.swift
//  SwimPal
//
//  Created by Bruno Benčević on 11.06.2022..
//

import SwiftUI

extension View {
    
    func removeNavigationBar() -> some View {
        self.navigationBarHidden(true)
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("")
    }
}
