//
//  View+Navigation.swift
//  SwimPal
//
//  Created by Bruno Benčević on 02.06.2022..
//

import SwiftUI

extension View {
    
    func pushNavigation<Item, Destination: View>(item: Binding<Item?>, @ViewBuilder destination: @escaping (Item) -> Destination) -> some View {
        let isActive = Binding(
            get: { item.wrappedValue != nil },
            set: { value in
                if !value {
                    item.wrappedValue = nil
                }
            }
        )
        
        return VStack(spacing: 0) {
            self
            
            NavigationLink(
                destination: LazyView(destination(item.wrappedValue!)),
                isActive: isActive,
                label: { EmptyView() }
            )
            .isDetailLink(false)
        }
    }
    
    func presentNavigation<Item, Destination: View>(item: Binding<Item?>, @ViewBuilder destination: @escaping (Item) -> Destination) -> some View {
        let isActive = Binding(
            get: { item.wrappedValue != nil },
            set: { value in
                if !value {
                    item.wrappedValue = nil
                }
            }
        )
        
        return self.fullScreenCover(isPresented: isActive) {
            if let item = item.wrappedValue {
                destination(item)
            } else {
                EmptyView()
            }
        }
    }
}
