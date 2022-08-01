//
//  MainTitle.swift
//  SwimPal
//
//  Created by Bruno Benčević on 31.07.2022..
//

import SwiftUI

struct MainTitle: View {
    
    let title: String
    let shouldAddShadow: Bool
    
    init(_ title: String, withShadow: Bool = false) {
        self.title = title
        self.shouldAddShadow = withShadow
    }
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Text(title)
                    .style(.roboto(.display1, .bold), .brand)
                    .padding(.horizontal, 10)
                
                Spacer(minLength: 0)
            }
            .frame(maxWidth: .infinity, height: Self.height)
            .padding(.top, Self.topPadding)
            .padding(.bottom, Self.bottomPadding)
            .background(Color.white)
            
            if shouldAddShadow {
                LinearGradient(colors: [.white, .white.opacity(0)], startPoint: .top, endPoint: .bottom)
                    .frame(height: Self.shadowHeight)
            }
        }
    }
    
    static let topPadding: CGFloat = 10
    static let bottomPadding: CGFloat = 5
    static let height: CGFloat = CGFloat(CustomFontSize.display1.rawValue)
    // Shadow doesnt work for some reason
    static let shadowHeight: CGFloat = 0//15
    static let totalHeight: CGFloat = Self.topPadding + Self.height + Self.bottomPadding + Self.shadowHeight
}

struct MainTitle_Previews: PreviewProvider {
    static var previews: some View {
        ZStack(alignment: .top) {
            Color.blue
            
            MainTitle("Example title")
        }
        .ignoresSafeArea()
    }
}
