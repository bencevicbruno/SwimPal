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
        HStack(spacing: 0) {
            Spacer(minLength: 0)
            
            Text(verbatim: title)
                .style(.roboto(.headline2, .bold), .brand, .center)
            
            Spacer(minLength: 0)
        }
    }
}

struct SheetTitle_Previews: PreviewProvider {
    static var previews: some View {
        SheetTitle("Hello World!")
    }
}
