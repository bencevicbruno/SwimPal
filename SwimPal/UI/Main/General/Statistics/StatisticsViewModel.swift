//
//  StatisticsViewModel.swift
//  SwimPal
//
//  Created by Bruno Benčević on 11.06.2022..
//

import SwiftUI

final class StatisticsViewModel: ObservableObject {
    
    var onDismissed: EmptyCallback?
    
    init() {
        
    }
}

// MARK: - User Ineractions
extension StatisticsViewModel {
    
    func dismiss() {
        onDismissed?()
    }
}
