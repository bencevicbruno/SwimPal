//
//  SettingCell.swift
//  SwimPal
//
//  Created by Bruno Benčević on 31.07.2022..
//

import SwiftUI

struct SettingCell: View {
    
    let title: String
    let value: String
    let onTapped: EmptyCallback?
    
    init(_ title: String, value: String, onTapped: EmptyCallback? = nil) {
        self.title = title
        self.value = value
        self.onTapped = onTapped
    }
    
    var body: some View {
        HStack {
            Text(verbatim: title)
                .style(.roboto(.headline2, .bold), .white)
            
            Spacer(minLength: 10)
            
            Text(verbatim: value)
                .style(.roboto(.caption), .white)
            
            Image("icon_action")
                .frameForIcon()
        }
        .padding(.leading, 10)
        .padding(.vertical, 5)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.brand)
        )
        .onTapGesture {
            onTapped?()
        }
    }
}

struct SettingCell_Previews: PreviewProvider {
    static var previews: some View {
        SettingCell("Language", value: "English")
    }
}
