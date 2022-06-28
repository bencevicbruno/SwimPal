//
//  AboutViewModel.swift
//  SwimPal
//
//  Created by Bruno Benčević on 26.06.2022..
//

import SwiftUI

final class AboutViewModel: ObservableObject {
    
    var onDismissed: EmptyCallback?
    
    init() {
        
    }
    
    // MARK: - User Interaction
    
    func dismiss() {
        onDismissed?()
    }
}
