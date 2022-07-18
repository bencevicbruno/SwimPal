//
//  SwimPaltests.swift
//  SwimPal
//
//  Created by Bruno Benčević on 15.07.2022..
//

import SwiftUI

struct SwimPaltests: View {
    
    @State private var scrollViewOffset: CGPoint = .zero
    
    var body: some View {
        Button("Tap on me") {
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct SwimPaltests_Previews: PreviewProvider {
    static var previews: some View {
        SwimPaltests()
    }
}
