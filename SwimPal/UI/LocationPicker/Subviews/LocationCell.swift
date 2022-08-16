//
//  LocationCell.swift
//  SwimPal
//
//  Created by Bruno Benčević on 06.08.2022..
//

import SwiftUI

struct LocationCell: View {
    
    private let name: String
    private let onTapped: EmptyCallback?
    
    init(_ name: String, _ onTapped: EmptyCallback? = nil) {
        self.name = name
        self.onTapped = onTapped
    }
    
    var body: some View {
        HStack(spacing: 0) {
            Text(name)
                .style(.roboto(.body, .medium), .black, .leading)
            
            Spacer(minLength: 0)
            
            Image("icon_action")
                .frameForIcon()
        }
        .padding(.leading, 10)
        .frame(maxWidth: .infinity, height: 50)
        .background(
            Rectangle()
                .fill(Color.gray242)
        )
        .contentShape(Rectangle())
        .onTapGesture {
            onTapped?()
        }
    }
}

struct LocationCell_Previews: PreviewProvider {
    static var previews: some View {
        LocationCell("Osijek")
    }
}
