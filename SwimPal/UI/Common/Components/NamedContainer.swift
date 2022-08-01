//
//  NamedContainer.swift
//  SwimPal
//
//  Created by Bruno Benčević on 13.07.2022..
//

import SwiftUI

struct NamedContainer<Content: View>: View {
    
    private let title: String
    private let color: UIColor
    private let onEditTapped: EmptyCallback?
    @ViewBuilder var viewBuilder: () -> Content
    
    init(_ title: String, color: UIColor = .brand, onEditTapped: EmptyCallback? = nil, @ViewBuilder _ viewBuilder: @escaping () -> Content) {
        self.title = title
        self.color = color
        self.onEditTapped = onEditTapped
        self.viewBuilder = viewBuilder
    }
    
    var body: some View {
        viewBuilder()
            .padding([.leading, .trailing], 15)
            .padding(.bottom, 20)
            .padding(.top, 30)
            .background(
                ZStack(alignment: .topLeading) {
                    RoundedRectangle(cornerRadius: 15)
                        .strokeBorder(Color(color), lineWidth: 2)
                        .padding(.bottom, 5)
                        .padding(.top, 15)
                    
                    HStack(spacing: 0) {
                        Text(verbatim: title)
                            .style(.roboto(.caption, .medium), color)
                            .padding(.horizontal, 5)
                            .background(Color.white)
                        
                        Spacer()
                        
                        if onEditTapped != nil {
                            Image("icon_edit")
                                .resizable()
                                .scaledToFit()
                                .frame(20)
                                .frame(30)
                                .background(Color.white)
                                .onTapGesture {
                                    onEditTapped?()
                                }
                        }
                    }
                    .padding(.horizontal, 20)
                    .frame(height: 30)
                }
                , alignment: .top)
    }
}

struct NamedContainer_Previews: PreviewProvider {
    static var previews: some View {
        NamedContainer("Example") {
            Text("Hello SwiftUI, how are you?")
        }
    }
}
