//
//  TrainingsEmptyView.swift
//  SwimPal
//
//  Created by Bruno Benčević on 26.07.2022..
//

import SwiftUI

struct TrainingsEmptyView: View {
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            
            Image("illustration_error")
                .resizable()
                .scaledToFit()
            
            Text("No trainings found")
                .style(.roboto(.headline1, .bold), .brand, .center)
                .padding(.vertical, 20)
            
            Text("It's time to start swimming man! Hit that plus button to start a new training.")
                .style(.roboto(.body), .black, .center)
            
            Spacer()
        }
        .padding(.horizontal, 50)
    }
}

struct TrainingsEmptyView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingsEmptyView()
    }
}
