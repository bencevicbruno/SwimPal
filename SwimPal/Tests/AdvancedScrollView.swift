//
//  AdvancedScrollView.swift
//  SwimPal
//
//  Created by Bruno Benčević on 15.07.2022..
//

import SwiftUI

struct AdvancedScrollView<Content: View>: View {
    let axis: Axis.Set
    let showsIndicators: Bool
    @Binding var offset: CGPoint
    @ViewBuilder let content: () -> Content
    
    
    var body: some View {
        ScrollView(axis, showsIndicators: showsIndicators) {
            GeometryReader { proxy in
                Color.clear.preference(
                    key: OffsetPreferenceKey.self,
                    value: proxy.frame(in: .named(coordinateSpaceName)).origin
                )
            }
            .frame(width: 0, height: 0)
            
            content()
        }
        .coordinateSpace(name: coordinateSpaceName)
        .onPreferenceChange(OffsetPreferenceKey.self) { value in
            offset = value
        }
    }
    
    init(_ axis: Axis.Set = .vertical, showsIndicators: Bool = true, offset: Binding<CGPoint> = .empty, _ content: @escaping () -> Content) {
        self.axis = axis
        self.showsIndicators = showsIndicators
        self._offset = offset
        self.content = content
    }
    
    private let coordinateSpaceName = "ScrollViewOrigin"
}

extension Binding where Value == CGPoint {
    
    static var empty: Binding<CGPoint> {
        return .init(get: { .zero }, set: { _ in })
    }
}

private struct OffsetPreferenceKey: PreferenceKey {
    
    static var defaultValue: CGPoint = .zero
    
    static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) { }
}

struct AdvancedScrollView_Previews: PreviewProvider {
    static var previews: some View {
        AdvancedScrollView(.vertical, showsIndicators: false) {
            ForEach(0..<50) { index in
                Text("\(index)")
                    .frame(height: 20)
                    .frame(maxWidth: 100)
            }
        }
    }
}
