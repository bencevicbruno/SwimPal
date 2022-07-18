//
//  TrainingSummaryViewModel.swift
//  SwimPal
//
//  Created by Bruno Benčević on 28.06.2022..
//

import Foundation

final class TrainingSummaryViewModel: ObservableObject {
    
    var onDismissed: EmptyCallback?
    
    init() {
        
    }
    
    func dismiss() {
        onDismissed?()
    }
}
