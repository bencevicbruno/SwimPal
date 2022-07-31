//
//  NamedContainer.swift
//  SwimPal
//
//  Created by Bruno Benčević on 13.07.2022..
//

import SwiftUI

struct NamedContainer<Content: View>: View {
    
    let title: String
    let color: UIColor
    @ViewBuilder var viewBuilder: () -> Content
    
    init(_ title: String, color: UIColor = .brand, @ViewBuilder _ viewBuilder: @escaping () -> Content) {
        self.title = title
        self.color = color
        self.viewBuilder = viewBuilder
    }
    
    var body: some View {
        viewBuilder()
            .padding([.leading, .trailing], 15)
            .padding(.bottom, 20)
            .padding(.top, 25)
            .background(
                ZStack(alignment: .topLeading) {
                    RoundedRectangle(cornerRadius: 15)
                        .strokeBorder(Color(color), lineWidth: 2)
                        .padding(.vertical, 7.5)
                    
                    Text(verbatim: title)
                        .style(.roboto(.caption, .medium), color)
                        .padding(.horizontal, 5)
                        .background(Color.white)
                        .padding(.leading, 20)
                }
            )
    }
}

struct NamedContainer_Previews: PreviewProvider {
    static var previews: some View {
        NamedContainer("Example") {
            Text("Hello SwiftUI, how are you?")
        }
    }
}
