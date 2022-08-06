//
//  ActivityIndicator.swift
//  SwimPal
//
//  Created by Bruno Benčević on 06.08.2022..
//

import SwiftUI

struct ActivityIndicator: View {
    
    private let size: CGFloat
    
    init(size: CGFloat = 40) {
        self.size = size
    }
    
    @State private var didAppear = false
    @State private var circleIndex = 0
    
    private let timer = Timer.publish(every: 0.33, on: .main, in: .common).autoconnect()
    
    var body: some View {
        HStack(spacing: size / 2) {
            circle(index: 0)
            
            circle(index: 1)
            
            circle(index: 2)
        }
        .onReceive(timer) { _ in
            withAnimation(.easeInOut) {
                circleIndex = (circleIndex + 1) % 3
            }
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

private extension ActivityIndicator {
    
    func circle(index: Int) -> some View {
        Circle()
            .fill(Color.brand)
            .frame(circleIndex == index ? size : size * 2 / 3)
            .frame(40)
    }
}

struct ActivityIndicator_Previews: PreviewProvider {
    static var previews: some View {
        ActivityIndicator()
    }
}
