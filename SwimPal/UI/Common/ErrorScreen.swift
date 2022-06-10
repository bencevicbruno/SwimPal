//
//  ErrorScreen.swift
//  SwimPal
//
//  Created by Bruno Benčević on 30.05.2022..
//

import SwiftUI

struct ErrorScreen: View {
    
    private var message: String
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Error")
                .font(.title)
                .fontWeight(.bold)
            
            Text(message)
                .fontWeight(.light)
                .multilineTextAlignment(.center)
                .font(.body)
                .padding(10, .standard)
            
            Image(systemName: "hammer.circle")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding(25, .standard)
            
            Spacer()
        }
        .padding(20)
    }
    
    init(_ message: String) {
        self.message = message
    }
    
    init(forCoordinator coordinator: String) {
        let coordinatorName = String(coordinator.split(separator: "(").first ?? Substring(coordinator))
        self.message = "\(coordinatorName) has no living ViewModels/Coordinators"
    }
}

struct ErrorScreen_Previews: PreviewProvider {
    static var previews: some View {
        ErrorScreen("Lorem ipsum lorem ipsum lorem ipsum lorem ipsum")
    }
}
