//
//  NoInternetScreen.swift
//  SwimPal
//
//  Created by Bruno Benčević on 20.06.2022..
//

import SwiftUI

struct ErrorScreen: View {
    
    private let data: ErrorData
    
    init(_ data: ErrorData) {
        self.data = data
    }
    
    init(for coordinator: String) {
        self.data = .init(title: "Error", message: "It seems like \(coordinator) is in a wierd state.", illustration: "illustration_error")
    }
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer(minLength: 20)
            
            illustration
                .padding(.bottom, 40)
            
            title
                .padding(.bottom, 24)
            
            message
            
            Spacer(minLength: 24)
            
            retryButton
                .padding(.bottom, 50)
        }
        .padding(.horizontal, 12)
        .frame(maxHeight: .infinity)
        .edgesIgnoringSafeArea(.bottom)
        .background(.white)
    }
}

private extension ErrorScreen {
    
    var illustration: some View {
        Image(data.illustration)
            .resizable()
            .scaledToFit()
    }
    
    var title: some View {
        Text(data.title)
            .style(.roboto(.display1, .bold), .brand)
    }
    
    var message: some View {
        Text(data.message)
            .style(.roboto(.body, .medium))
    }
    
    var retryButton: some View {
        Text((data.retryTitle ?? Localizable.retry).uppercased())
            .style(.roboto(.headline1, .bold), .white)
            .padding(.vertical, 20)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.brand)
            )
            .onTapGesture {
//                Dialogs.hideNoInternet()
                data.onRetry?()
            }
    }
}

struct ErrorScreen_Previews: PreviewProvider {
    static var previews: some View {
        ErrorScreen(.init(title: "No Internet", message: "Please connect to the internet", illustration: "illustration_error", retryTitle: "Retry", onRetry: nil))
    }
}
