//
//  HomeView.swift
//  SwimPal
//
//  Created by Bruno Benčević on 02.06.2022..
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        Text("Hello, Home!")
    }
    
    init(_ viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(.init())
    }
}
