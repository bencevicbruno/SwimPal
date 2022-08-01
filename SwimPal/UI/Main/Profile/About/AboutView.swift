//
//  AboutView.swift
//  SwimPal
//
//  Created by Bruno Benčević on 26.06.2022..
//

import SwiftUI

struct AboutView: View {
    
    @ObservedObject var viewModel: AboutViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            NavigationBar(Localizable.about, onXTapped: viewModel.dismiss)
            
            ScrollView(.vertical) {
                content
                    .padding(.horizontal, 10)
            }
        }
    }
}

private extension AboutView {
    
    var content: some View {
        LazyVStack(spacing: 15) {
            ForEach(viewModel.items) {
                AboutSection($0)
                    .addShadow(.small)
            }
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView(viewModel: .init())
    }
}
