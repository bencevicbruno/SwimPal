//
//  Training.swift
//  SwimPal
//
//  Created by Bruno Benčević on 22.06.2022..
//

import Foundation

class Training: Codable, Identifiable, Hashable, ObservableObject {
    
    static func == (lhs: Training, rhs: Training) -> Bool {
        lhs.id == rhs.id
    }
    
    let id: UUID
    var name: String
    let date: Date
    let time: Time
    var location: Training.Location?
    let category: Training.Category
    let excercises: [Training.Excercise]
    var notes: String?
    
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
    
    private init(id: UUID, name: String, time: Time, location: Training.Location? = nil, category: Training.Category, exercises: [Training.Excercise] = [], notes: String? = nil) {
        self.id = id
        self.name = name
        self.date = Date()
        self.time = time
        self.location = location
        self.category = category
        self.excercises = exercises
        self.notes = notes
    }
    
    var totalDistance: Distance {
        let totalMeters = excercises
            .filter { $0.style.countsAsSwimming }
            .map { $0.value }
            .reduce(0, +)
        
        return Distance(UInt(totalMeters), .meters)
    }
    
    var averageSpeed: Speed {
        .init(distance: totalDistance, time: time)
    }
    
    var hashValue: Int {
        id.hashValue
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    func withUpdatedInfo(name: String, location: Training.Location? = nil, notes: String? = nil) -> Training {
        return Training(id: id, name: name, time: time, location: location, category: category, exercises: excercises, notes: notes)
    }
    
}

extension Training {
    
    static var random: Training {
        Training(name: "Random", time: .zero, location: .init(name: "Somwehere"), category: .randomCase, exercises: Training.Category.lifeguard.excercises, notes: .loremIpsum)
    }
    
    static var sample: Training {
        Training(name: "Sample Training", time: .init(90, .minutes), location: .osijek, category: .lifeguard, exercises: Training.Category.lifeguard.excercises, notes: .loremIpsum)
    }
}
