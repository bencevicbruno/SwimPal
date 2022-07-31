//
//  Training.swift
//  SwimPal
//
//  Created by Bruno Benčević on 22.06.2022..
//

import Foundation

struct Training: Codable, Identifiable {
    let id: UUID
    let name: String
    let date: Date
    let time: Time
    let location: Training.Location?
    let category: Training.Category
    let excercises: [Training.Excercise]
    let notes: String?
    
    init(name: String, time: Time, location: Training.Location? = nil, category: Training.Category, exercises: [Training.Excercise] = [], notes: String? = nil) {
        self.id = UUID()
        self.name = name
        self.date = Date()
        self.time = time
        self.location = location
        self.category = category
        self.excercises = exercises
        self.notes = notes
    }
}

extension Training {
    
    static var random: Training {
        Training(name: "Random", time: .zero, location: .init(name: "Somwehere"), category: .random, exercises: Training.Category.lifeguard.excercises, notes: .loremIpsum)
    }
    
    static var sample: Training {
        Training(name: "Sample Training", time: .init(90, .minutes), location: .osijek, category: .lifeguard, exercises: Training.Category.lifeguard.excercises, notes: .loremIpsum)
    }
}
