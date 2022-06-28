//
//  HomeViewModel.swift
//  SwimPal
//
//  Created by Bruno Benčević on 02.06.2022..
//

import SwiftUI

final class HomeViewModel: ObservableObject {
    
    @Published var currentMotivationIndex = 0
    
    var motivations = Motivation.samples
    
    init() {
        changeMotivation()
    }
    
    func changeMotivation() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [weak self] in
            guard let self = self else { return }
            
            self.currentMotivationIndex = (self.currentMotivationIndex + 1) % self.motivations.count
            self.changeMotivation()
        }
    }
}
