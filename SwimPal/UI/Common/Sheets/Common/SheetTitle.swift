//
//  SheetTitle.swift
//  SwimPal
//
//  Created by Bruno Benčević on 16.07.2022..
//

import SwiftUI

struct SheetTitle: View {
    
    private let title: String
    
    init(_ title: String) {
        self.title = title
    }
    
    var body: some View {
        Text(verbatim: title)
            .style(.roboto(.headline2, .bold), .brand, .center)
    }
}

struct SheetTitle_Previews: PreviewProvider {
    static var previews: some View {
        SheetTitle("Hello World!")
    }
}
