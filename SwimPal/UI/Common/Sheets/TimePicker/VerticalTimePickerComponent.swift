//
//  VerticalTimePickerComponent.swift
//  SwimPal
//
//  Created by Bruno Benčević on 15.07.2022..
//

import SwiftUI

struct VerticalTimePickerComponent: View {
    let values: [String] = {
        var result = (1...10).map { "\($0)" }
        result.insert("", at: 0)
        result.append("")
        
        return result
    }()
    
    @State private var index: Int = 0
    @State private var midPoint: CGFloat = 0
    @State private var lastScrollOfset: CGPoint = .zero
    @State private var scrollOffset: CGPoint = .zero
    
    var body: some View {
        GeometryReader { geo in
            AdvancedScrollView(.vertical, showsIndicators: false, offset: $scrollOffset) {
                ScrollViewReader { reader in
                    LazyVStack(spacing: 10) {
                        ForEach(values, id: \.self) { value in
                            GeometryReader { localGeo in
                                Text(value)
                                    .style(.roboto(.headline1, .bold), getColor(midY: localGeo.midY), .center)
                                    .frame(height: 60)
                                    .frame(maxWidth: .infinity)
                                    .id(value)
                            }
                            .frame(height: 60)
                        }
                    }
                    .onChange(of: scrollOffset) { newOffset in
                        if abs(lastScrollOfset.y - scrollOffset.y) < 1 {
                            let index = Int(abs(scrollOffset.y / (Self.cellSpacing + Self.cellHeight)) + 1)
                            
                            reader.scrollTo(index, anchor: .top)
                        }
                        
                        lastScrollOfset = newOffset
                    }
                    
                }
            }
            .onAppear {
                midPoint = geo.midY
            }
        }
        .frame(height: Self.height)
        .background(Color.yellow)
    }
    
    func getColor(midY: CGFloat) -> UIColor {
        let distance = abs(midY - midPoint)
        let value = distance / (Self.height / 2)
        
        return UIColor(white: min(value, 0.5), alpha: 1.0)
    }
    
    static let cellHeight: CGFloat = 60
    static let cellSpacing: CGFloat = 10
    static let height: CGFloat = 3 * Self.cellHeight + 2 * Self.cellSpacing
}

struct VerticalTimePickerComponent_Previews: PreviewProvider {
    static var previews: some View {
        
        VerticalTimePickerComponent()
    }
}
