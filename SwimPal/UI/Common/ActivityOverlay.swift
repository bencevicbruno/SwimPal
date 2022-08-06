//
//  ActivityOverlay.swift
//  SwimPal
//
//  Created by Bruno Benčević on 02.08.2022..
//

import SwiftUI

struct ActivityOverlay: View {
    
    let size: CGFloat
    
    init(size: CGFloat = 40) {
        self.size = size
    }
    
    @State private var didAppear = false
    
    var body: some View {
        ZStack {
            overlay
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .isVisible(didAppear)
            
            ActivityIndicator(size: size)
        }
        .onAppear {
            withAnimation(.easeIn) {
                didAppear = true
            }
        }
        .onDisappear {
            withAnimation(.easeIn) {
                didAppear = false
            }
        }
    }
}

private extension ActivityOverlay {
    
    @ViewBuilder
    var overlay: some View {
        if #available(iOS 15, *) {
            Rectangle()
                .fill(Material.thin)
        } else {
            Rectangle()
                .fill(Color.gray.opacity(0.3))
        }
    }
}

struct ActivityOverlay_Previews: PreviewProvider {
    
    static var previews: some View {
        ActivityOverlay()
    }
}
