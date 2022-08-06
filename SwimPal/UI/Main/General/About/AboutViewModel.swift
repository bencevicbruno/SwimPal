//
//  AboutViewModel.swift
//  SwimPal
//
//  Created by Bruno Benčević on 26.06.2022..
//

import SwiftUI

struct AboutItem: Identifiable {
    let id = UUID()
    let title: String
    let text: String
}

final class AboutViewModel: ObservableObject {
    
    var onDismissed: EmptyCallback?
    
    init() {
        
    }
    
    var items: [AboutItem] {
        var items: [AboutItem] = [
            AboutItem(title: Localizable.about_section_1_title,
                      text: Localizable.about_section_1_text),
            AboutItem(title: Localizable.about_section_2_title,
                      text: Localizable.about_section_2_text)]
        
        if #available(iOS 15, *) {
            items.append(AboutItem(title: Localizable.about_section_3_title,
                                   text: Localizable.about_section_3_text))
        } else {
            items.append(AboutItem(title: Localizable.about_section_3_title,
                                    text: Localizable.about_section_3_text_preIOS15))
        }
        
        items.append(AboutItem(title: Localizable.about_section_4_title,
                               text: Localizable.about_section_4_text))
        
        return items
    }
}

// MARK: - User Interaction
extension AboutViewModel {
    
    func dismiss() {
        onDismissed?()
    }
}
