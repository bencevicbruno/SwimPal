//
//  TrainingServiceProtocol.swift
//  SwimPal
//
//  Created by Bruno Benčević on 04.08.2022..
//

import Foundation



protocol TrainingsServiceProtocol {
    
    func fetchTrainings(_ completion: @escaping (Result<[Training], Error>) -> Void)
    func fetchTraining(withID id: UUID, _ completion: @escaping (Result<Training, Error>) -> Void)
    func saveTraining(_ training: Training, _ completion: @escaping (Result<Void, Error>) -> Void)
    func editTraining(withID id: UUID, with newData: EditTrainingModel, _ completion: @escaping (Result<Void, Error>) -> Void)
    func deleteTraining(withID id: UUID, _ completion: @escaping (Result<Void, Error>) -> Void)
}
