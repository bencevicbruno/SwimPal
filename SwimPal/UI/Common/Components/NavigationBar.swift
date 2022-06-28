//
//  NavigationBar.swift
//  SwimPal
//
//  Created by Bruno Benčević on 11.06.2022..
//

import SwiftUI

struct NavigationBar: View {
    
    static let height: CGFloat = 60
    
    private var title: String
    private var onBackTapped: EmptyCallback?
    private var onXTapped: EmptyCallback?
    
    var body: some View {
        HStack {
            Image("icon_back")
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
                .frame(width: 40, height: 40)
                .onTapGesture {
                    onBackTapped?()
                }
                .padding(.horizontal, 10)
                .isVisible(onBackTapped != nil)
            
            Spacer()
            
            Text(verbatim: title)
                .style(.roboto(.display1, .bold), .brand)
            
            Spacer()
            
            Image(systemName: "multiply")
                .resizable()
                .scaledToFit()
                .foregroundColor(.brand)
                .frame(width: 24, height: 24)
                .frame(width: 40, height: 40)
                .onTapGesture {
                    onXTapped?()
                }
                .padding(.horizontal, 10)
                .isVisible(onXTapped != nil)
        }
        .frame(height: Self.height)
        .frame(maxWidth: .infinity)
        .background(.white)
    }
    
    init(_ title: String, onBackTapped: EmptyCallback? = nil, onXTapped: EmptyCallback? = nil) {
        self.title = title
        self.onBackTapped = onBackTapped
        self.onXTapped = onXTapped
    }
}
struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar("Test", onXTapped: {})
    }
}
