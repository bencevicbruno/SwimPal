//
//  ErrorData.swift
//  SwimPal
//
//  Created by Bruno Benčević on 20.06.2022..
//

import Foundation

struct ErrorData: Identifiable {
    let id = UUID()
    let title: String
    let message: String
    let illustration: String
    let retryTitle: String?
    let onRetry: EmptyCallback?
    
    init(title: String, message: String, illustration: String, retryTitle: String? = nil, onRetry: EmptyCallback? = nil) {
        self.title = title
        self.message = message
        self.illustration = illustration
        self.retryTitle = retryTitle
        self.onRetry = onRetry
    }
}
