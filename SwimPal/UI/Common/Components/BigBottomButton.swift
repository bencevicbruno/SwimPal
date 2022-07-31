//
//  BigBottomButton.swift
//  SwimPal
//
//  Created by Bruno Benčević on 11.07.2022..
//

import SwiftUI

struct BigBottomButton: View {
    
    private let title: String
    private let isEnabled: Bool
    private let onTapped: EmptyCallback?
    
    var body: some View {
        Text(verbatim: title.uppercased())
            .style(.roboto(.headline1, .black), .white, .center)
            .frame(maxWidth: .infinity)
            .frame(height: Self.height)
            .padding(.bottom, Self.bottomPadding)
            .background(isEnabled ? Color.brand : Color.gray142)
            .onTapGesture {
                if isEnabled {
                    onTapped?()
                }
            }
    }
    
    init(_ title: String, isEnabled: Bool = true, onTapped: EmptyCallback? = nil) {
        self.title = title
        self.isEnabled = isEnabled
        self.onTapped = onTapped
    }
    
    static let height: CGFloat = 60
    static let bottomPadding: CGFloat = UIScreen.bottomUnsafePadding / 2
    static let totalHeight = height + bottomPadding
}

private extension BigBottomButton {
    
    var background: some View {
        ZStack(alignment: .bottom) {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.brand)
                .frame(height: Self.height)
            
            Rectangle()
                .fill(Color.brand)
                .frame(height: 15)
        }
        .frame(height: Self.height)
        .frame(maxWidth: .infinity)
    }
}

extension BigBottomButton {
    
    func addShadow(color: Color = .shadow, radius: CGFloat = 10, offset: CGFloat = -5) -> some View {
        self.clipped()
            .shadow(color: .shadow, radius: radius, y: offset)
            .mask(Rectangle().padding(.top, -2 * radius))
    }
}

struct BigBottomButton_Previews: PreviewProvider {
    static var previews: some View {
        BigBottomButton("Tap me!")
            .addShadow()
    }
}
