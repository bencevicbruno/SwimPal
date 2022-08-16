//
//  SwimPaltests.swift
//  SwimPal
//
//  Created by Bruno Benčević on 15.07.2022..
//

import SwiftUI

struct SwimPaltests: View {
    
    @State private var scrollViewOffset: CGPoint = .zero
    
    @State private var text = ""
    @State private var response = ""
    
    var body: some View {
        VStack {
            TextField("prefix", text: $text)
            
            Button("Search") {
                let service = GeoNamesService()
                
                service.fetchCities(prefixedWith: text) { result in
                    switch result {
                    case .success(let rr):
                        response = "\(rr.locations)"
                    case .failure(let error):
                        response = "Failed due to \(error)"
                    }
                }
            }
            
            Text(response)
        }
    }
}

struct SwimPaltests_Previews: PreviewProvider {
    static var previews: some View {
        SwimPaltests()
    }
}
