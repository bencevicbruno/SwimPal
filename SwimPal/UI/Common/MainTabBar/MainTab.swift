//
//  MainTab.swift
//  SwimPal
//
//  Created by Bruno Benčević on 26.06.2022..
//

import Foundation

enum MainTab: CaseIterable, Identifiable {
    case home
    case trainings
    case profile
    
    var id: Self { self }
    
    func iconName(selected: Bool = false) -> String {
        return selected ? "icon_mainTab_\(self)_selected" : "icon_mainTab_\(self)"
    }
}
