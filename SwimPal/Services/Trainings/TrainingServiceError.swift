//
//  TrainingServiceError.swift
//  SwimPal
//
//  Created by Bruno Benčević on 04.08.2022..
//

import Foundation

enum TrainingsServiceError: Error {
    case unableToFetchTrainings
    case trainingNotFound
    case failedToSaveTraining
    case failedToEditTraining
}
