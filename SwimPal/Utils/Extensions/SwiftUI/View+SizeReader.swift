//
//  View+SizeReader.swift
//  SwimPal
//
//  Created by Bruno Bencevic on 02.11.2022..
//

import SwiftUI

extension View {
    
    func readSize(into sizeBinding: Binding<CGSize>) -> some View {
        self
            .background(
                GeometryReader { geometryProxy in
                    Color.clear
                        .preference(key: SizePreferenceKey.self, value: geometryProxy.size)
                }
            )
            .onPreferenceChange(SizePreferenceKey.self) { size in
                sizeBinding.wrappedValue = size
            }
    }
}

fileprivate struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
}
