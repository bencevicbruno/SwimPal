//
//  MainTabBar.swift
//  SwimPal
//
//  Created by Bruno Benčević on 26.06.2022..
//

import SwiftUI

struct MainTabBar: View {
    
    @Binding var currentTab: MainTab
    @Binding var isHidden: Bool
    
    var body: some View {
        ZStack(alignment: .bottom) {
            background
            
            HStack(spacing: 0) {
                ForEach(MainTab.allCases) { tab in
                    ZStack(alignment: .bottom) {
                        if (tab == currentTab) {
                            tabBackground
                        }
                        
                        Image(tab.iconName(selected: tab == currentTab))
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .frame(width: Self.height, height: Self.height)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.bottom, UIScreen.bottomUnsafePadding - (tab == currentTab ? 0 : 15))
                    .onTapGesture {
                        currentTab = tab
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: -10)
        .offset(x: 0, y: isHidden ? Self.height * 2 : 0)
    }
    
    static let height: CGFloat = 55
}

private extension MainTabBar {
    
    var background: some View {
        Rectangle()
            .fill(.white)
            .frame(height: Self.height * 3 / 4)
            .frame(maxWidth: .infinity)
            .padding(.bottom, UIScreen.bottomUnsafePadding)
            .background(Color.white)
    }
    
    var tabBackground: some View {
        ZStack(alignment: .bottom) {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.brand)
                .frame(height: Self.height * 2 / 3)
            
            Circle()
                .fill(Color.brand)
        }
        .frame(width: Self.height, height: Self.height)
    }
}

struct MainTabBar_Previews: PreviewProvider {
    static var previews: some View {
        ZStack(alignment: .bottom) {
            Image("sample_background")
                .resizable()
                .scaledToFill()
            
            MainTabBar(currentTab: .constant(.home), isHidden: .constant(false))
        }
    }
}
