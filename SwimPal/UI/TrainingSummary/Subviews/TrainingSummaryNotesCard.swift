//
//  TrainingSummaryNotesCard.swift
//  SwimPal
//
//  Created by Bruno Benčević on 29.07.2022..
//

import SwiftUI

struct TrainingSummaryNotesCard: View {
    
    private let notes: String
    
    init(_ notes: String) {
        self.notes = notes
    }
    
    var body: some View {
        TrainingSummaryCardBase("Notes", iconName: "icon_notes") {
            Text(notes)
                .style(.roboto(.body, .medium), .black, .leading)
        }
    }
}

struct TrainingSummaryNotesCard_Previews: PreviewProvider {
    static var previews: some View {
        TrainingSummaryNotesCard(.loremIpsum)
    }
}
