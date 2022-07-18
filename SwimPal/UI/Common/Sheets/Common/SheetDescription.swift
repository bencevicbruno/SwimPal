//
//  SheetDescription.swift
//  SwimPal
//
//  Created by Bruno Benčević on 16.07.2022..
//

import SwiftUI

struct SheetDescription: View {
    
    private let description: String
    
    init(_ description: String) {
        self.description = description
    }
    
    var body: some View {
        Text(verbatim: description)
            .style(.roboto(.body, .regular), .black, .center)
    }
}

struct SheetDescription_Previews: PreviewProvider {
    static var previews: some View {
        SheetDescription("This is a sample desciption.")
    }
}
