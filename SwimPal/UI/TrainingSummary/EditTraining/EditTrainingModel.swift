//
//  EditTrainingModel.swift
//  SwimPal
//
//  Created by Bruno Benčević on 01.08.2022..
//

import Foundation

struct EditTrainingModel {
    var name: String
    var location: Training.Location?
    var notes: String?
    
    init(name: String, location: Training.Location? = nil, notes: String? = nil) {
        self.name = name
        self.location = location
        self.notes = notes
    }
}
