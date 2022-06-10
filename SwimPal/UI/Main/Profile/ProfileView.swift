//
//  ProfileView.swift
//  SwimPal
//
//  Created by Bruno Benčević on 02.06.2022..
//

import SwiftUI

struct ProfileView: View {
    
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        Text("Hello, Profile!")
    }
    
    init(_ viewModel: ProfileViewModel) {
        self.viewModel = viewModel
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(.init())
    }
}
