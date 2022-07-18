//
//  TrainingExcerciseProtocol.swift
//  SwimPal
//
//  Created by Bruno Benčević on 30.06.2022..
//

import Foundation

extension Training {
    
    struct Excercise: Identifiable, Codable {
        let id: UUID
        let style: Training.Excercise.Style
        let value: Int
        let numberOfRepetitions: Int
        let timeLimit: Time?
        var isInProgress: Bool
        
        init(style: Training.Excercise.Style, value: Int, numberOfRepetitions: Int = 1, timeLimit: Time? = nil, isInProgress: Bool = false) {
            self.id = UUID()
            self.style = style
            self.value = value
            self.numberOfRepetitions = numberOfRepetitions
            self.timeLimit = timeLimit
            self.isInProgress = isInProgress
        }
        
        static var stretching: Excercise {
            .init(style: .stretching, value: 5)
        }
    }
}
