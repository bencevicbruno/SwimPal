//
//  Image+.swift
//  SwimPal
//
//  Created by Bruno Benčević on 22.06.2022..
//

import SwiftUI

extension Image {
    
    func frameForIcon() -> some View {
        self.resizable()
            .scaledToFit()
            .frame(width: 24, height: 24)
            .frame(width: 40, height: 40)
    }
}
