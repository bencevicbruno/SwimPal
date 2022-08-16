//
//  TrainingNotesCard.swift
//  SwimPal
//
//  Created by Bruno Benčević on 31.07.2022..
//

import SwiftUI

struct TrainingNotesCard: View {
    
    let notes: String?
    let onAddNotesTapped: EmptyCallback?
    
    init(_ notes: String? = nil, _ onAddNotesTapped: EmptyCallback? = nil) {
        self.notes = notes
        self.onAddNotesTapped = onAddNotesTapped
    }
    
    var body: some View {
        NamedContainer("Notes", onEditTapped: notes == nil ? nil : onAddNotesTapped) {
            if let notes = notes {
                HStack(spacing: 0) {
                    Text(notes)
                        .style(.roboto(.body), .black, .leading)
                    
                    Spacer(minLength: 0)
                }
                .padding(.vertical, 5)
            } else {
                Text("Add notes")
                    .style(.roboto(.body, .bold), .brand, .center)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        onAddNotesTapped?()
                    }
            }
        }
    }
}

struct TrainingNotesCard_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            TrainingNotesCard()
            
            TrainingNotesCard(.loremIpsum)
        }
    }
}
