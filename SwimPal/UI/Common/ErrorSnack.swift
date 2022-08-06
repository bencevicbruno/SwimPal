//
//  ErrorSnack.swift
//  SwimPal
//
//  Created by Bruno Benčević on 03.08.2022..
//

import SwiftUI

struct ErrorSnack: View {
    
    private let title: String
    private let message: String
    
    @Binding var isVisible: Bool
    
    @State private var didAppear = false
    
    init(_ isVisible: Binding<Bool>, title: String, message: String) {
        self._isVisible = isVisible
        self.title = title
        self.message = message
    }
    
    init(_ isVisible: Binding<Bool>, error: Error) {
        self._isVisible = isVisible
        self.title = "Error"
        self.message = error.localizedDescription
    }
    
    var body: some View {
        HStack(spacing: 15) {
            VStack(alignment: .leading, spacing: 10) {
                Text(title)
                    .style(.roboto(.body, .bold), .brand, .leading)
                
                Text(message)
                    .style(.roboto(.smallCaption, .regular), .black, .leading)
            }
            .padding(.vertical, 10)
            
            Image("icon_error")
                .frameForIcon()
        }
        .padding(.horizontal, 20)
        .background(
            HStack(spacing: 0) {
                Rectangle()
                    .fill(Color.brand)
                    .frame(width: 10)
                
                Color.white
            }
        )
        .frame(maxWidth: .infinity)
        .clipShape(.roundedRectangle(10))
        .offset(y: didAppear ? 0 : UIScreen.height / 2)
        .onAppear {
            withAnimation(.easeInOut) {
                didAppear = true
            }
            
            hide()
        }
    }
    
    private func hide() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                isVisible = false
            }
            
            withAnimation(.easeInOut) {
                didAppear
            }
        }
    }
}

struct ErrorSnack_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 0) {
            Spacer()
            
            ErrorSnack(.constant(true), title: "Test title", message: .loremIpsumShort)
                .addShadow()
                .padding()
        }
    }
}
