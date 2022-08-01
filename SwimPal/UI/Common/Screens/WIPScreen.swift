//
//  WIPScreen.swift
//  SwimPal
//
//  Created by Bruno Benčević on 31.07.2022..
//

import SwiftUI

struct WIPScreen: View {
    let title: String
    let message: String
    let illustrationName: String
    
    init(title: String, message: String, illustrationName: String = "illustration_error") {
        self.title = title
        self.message = message
        self.illustrationName = illustrationName
    }
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer(minLength: 10)
            
            Image(illustrationName)
                .resizable()
                .scaledToFit()
                .padding(.horizontal)
            
            Text(title)
                .style(.roboto(.headline1, .bold), .brand)
                .padding(.vertical, 20)
            
            Text(message)
                .style(.roboto(.body, .medium))
            
            Spacer(minLength: 10)
        }
        .padding(10)
        .background(Color.white)
    }
}

struct WIPScreen_Previews: PreviewProvider {
    static var previews: some View {
        WIPScreen(title: "WIP Screen", message: "This is yet to be done.")
    }
}
