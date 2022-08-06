//
//  SwimPaltests.swift
//  SwimPal
//
//  Created by Bruno Benčević on 15.07.2022..
//

import SwiftUI

struct SwimPaltests: View {
    
    @State private var scrollViewOffset: CGPoint = .zero
    
    @State private var text = "Lets go"
    
    var body: some View {
        ActivityOverlay()
    }
}

struct SwimPaltests_Previews: PreviewProvider {
    static var previews: some View {
        SwimPaltests()
    }
}
