//
//  NavigationBar.swift
//  SwimPal
//
//  Created by Bruno Benčević on 11.06.2022..
//

import SwiftUI

struct NavigationBar: View {
    
    static let height: CGFloat = 50
    
    private let title: String
    private var leftIconName: String = "icon_back"
    private let onLeftItemTapped: EmptyCallback?
    private var rightIconName: String = "icon_x"
    private let onRightItemTapped: EmptyCallback?
    
    init(_ title: String, onBackTapped: EmptyCallback? = nil, onXTapped: EmptyCallback? = nil) {
        self.title = title
        self.onLeftItemTapped = onBackTapped
        self.onRightItemTapped = onXTapped
    }
    
    init(_ title: String, onBackTapped: EmptyCallback? = nil, rightIconName: String, onRightItemTapped: @escaping EmptyCallback) {
        self.title = title
        self.onLeftItemTapped = onBackTapped
        self.rightIconName = rightIconName
        self.onRightItemTapped = onRightItemTapped
    }
    
    init(_ title: String, onXTapped: EmptyCallback? = nil, leftIconName: String, onLeftItemTapped: @escaping EmptyCallback) {
        self.title = title
        self.leftIconName = leftIconName
        self.onLeftItemTapped = onLeftItemTapped
        self.onRightItemTapped = onXTapped
    }
    
    var body: some View {
        HStack {
            leftIcon
            
            Spacer()
            
            Text(verbatim: title)
                .style(.roboto(.headline2, .bold), .brand)
            
            Spacer()
            
            rightIcon
        }
        .padding(.horizontal, 10)
        .frame(height: Self.height - 1)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .padding(.bottom, 1)
        .background(Color.gray)
    }
    
    
}

private extension NavigationBar {
    
    var leftIcon: some View {
        Image(leftIconName)
            .frameForIcon()
            .onTapGesture {
                onLeftItemTapped?()
            }
            .isHidden(onLeftItemTapped == nil)
    }
    
    var rightIcon: some View {
        Image(rightIconName)
            .frameForIcon()
            .onTapGesture {
                onRightItemTapped?()
            }
            .isHidden(onRightItemTapped == nil)
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar("Test", onXTapped: {})
    }
}
