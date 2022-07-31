//
//  PremadeTrainings.swift
//  SwimPal
//
//  Created by Bruno Benčević on 30.06.2022..
//

import Foundation

extension Training.Category {
    
    var excercises: [Training.Excercise] {
        switch self {
        case .lifeguard:
            return [
                .init(style: .freestyle, value: 100, numberOfRepetitions: 2),
                .init(style: .rest, value: 2),
                .init(style: .freestyle, value: 400, timeLimit: Time(8, .minutes)),
                .init(style: .rest, value: 5),
                .init(style: .freestyle, value: 50, numberOfRepetitions: 2),
                .init(style: .rest, value: 1),
                .init(style: .diving, value: 25),
                .init(style: .rest, value: 1),
                .init(style: .diving, value: 25),
            ]
        case .everythingX4:
            return [
                .init(style: .dry, value: 10),
                .init(style: .freestyle, value: 50, numberOfRepetitions: 4),
                .init(style: .rest, value: 2),
                .init(style: .freestyle, value: 100, numberOfRepetitions: 4),
                .init(style: .rest, value: 2),
                .init(style: .freestyle, value: 200, numberOfRepetitions: 4),
                .init(style: .rest, value: 2),
                .init(style: .sprint, value: 25, numberOfRepetitions: 4),
            ]
        case .endurance:
            return [
                .init(style: .freestyle, value: 1000, numberOfRepetitions: 3),
                .init(style: .rest, value: 10),
                .init(style: .dry, value: 10),
                .init(style: .backStroke, value: 100, numberOfRepetitions: 5),
                .init(style: .chestStroke, value: 100, numberOfRepetitions: 5),
            ]
        case .tooFastForYou:
            return [
                .init(style: .sprint, value: 50, numberOfRepetitions: 10),
                .init(style: .rest, value: 5),
                .init(style: .freestyle, value: 250),
                .init(style: .sprint, value: 50, numberOfRepetitions: 5, timeLimit: Time(1, .minutes)),
            ]
        case .randomized:
            return Self.generateRandomTraining()
        case .custom:
            return []
        }
    }
    
    fileprivate static func generateRandomTraining() -> [Training.Excercise] {
        let numberOfExcercises = (15...30).randomElement()!
        var excercises: [Training.Excercise] = []
        var availableStyles = Training.Excercise.Style.allCases
        availableStyles.removeAll(where: { $0 == .stretching })
        
        for _ in 0..<numberOfExcercises {
            let style = availableStyles.randomElement()!
            
            var value: Int
            if style.countsAsSwimming {
                value = [25, 100, 200, 500, 1000].randomElement()!
            } else if style == .rest {
                value = (2...5).randomElement()!
            } else if style == .dry {
                value = [5, 10, 15].randomElement()!
            } else { // diving
                value = 25
            }
            
            var numberOfRepetitions: Int
            if style.countsAsSwimming {
                numberOfRepetitions = (5...20).randomElement()!
            } else if style == .diving {
                numberOfRepetitions = (1...5).randomElement()!
            } else {
                numberOfRepetitions = 1
            }
            
            var timeLimit: UInt?
            if style.countsAsSwimming && Bool.random() {
                timeLimit = numberOfRepetitions.magnitude
            }
            
            excercises.append(.init(style: .allCases.randomElement()!, value: value, numberOfRepetitions: numberOfRepetitions, timeLimit: Time(timeLimit ?? 1, .minutes)))
        }
        
        return excercises
    }
}
