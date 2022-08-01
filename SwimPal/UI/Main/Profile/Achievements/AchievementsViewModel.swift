//
//  AchievementsViewModel.swift
//  SwimPal
//
//  Created by Bruno Benčević on 11.06.2022..
//

import SwiftUI

final class AchievementsViewModel: ObservableObject {
    
    var onDismissed: EmptyCallback?
    
    init() {
        
    }
}

// MARK: - User Interactions
extension AchievementsViewModel {
    
    func dismiss() {
        onDismissed?()
    }
}
