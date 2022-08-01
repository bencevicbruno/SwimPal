//
//  Image+.swift
//  SwimPal
//
//  Created by Bruno Benčević on 22.06.2022..
//

import SwiftUI

extension Image {
    
    func frameForIcon(size: CGFloat = 30) -> some View {
        self.resizable()
            .scaledToFit()
            .frame(size)
            .frame(40)
    }
}
