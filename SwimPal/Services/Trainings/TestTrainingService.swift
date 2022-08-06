//
//  NonpersistentTrainingService.swift
//  SwimPal
//
//  Created by Bruno Benčević on 04.08.2022..
//

import Foundation

final class TestTrainingService: TrainingsServiceProtocol {
    
    private var trainings: [Training] = [.sample]
    
    private let delayTime: Double
    
    init(delayTime: Double = 1.5) {
        self.delayTime = delayTime
    }
    
    func fetchTrainings(_ completion: @escaping (Result<[Training], Error>) -> Void) {
        delay { [weak self] in
            guard let self = self else { return }
            completion(.success(self.trainings))
        }
    }
    
    func fetchTraining(withID id: UUID, _ completion: @escaping (Result<Training, Error>) -> Void) {
        delay { [weak self] in
            guard let self = self else { return }
            if let training = self.trainings.first(where: { $0.id == id }) {
                completion(.success(training))
            } else {
                completion(.failure(TrainingsServiceError.trainingNotFound))
            }
        }
    }
    
    func saveTraining(_ training: Training, _ completion: @escaping (Result<Void, Error>) -> Void) {
        delay { [weak self] in
            guard let self = self else { return }
            self.trainings.append(training)
            completion(.success(()))
        }
    }
    
    func editTraining(withID id: UUID, with newData: EditTrainingModel, _ completion: @escaping (Result<Void, Error>) -> Void) {
        delay { [weak self] in
            guard let self = self else { return }
            self.fetchTraining(withID: id) { [weak self] result in
                guard let self = self else { return }
                
                switch result {
                case .success(let training):
                    let newTraining = training.withUpdatedInfo(name: newData.name, location: newData.location, notes: newData.notes)
                    
                    self.trainings.removeAll(where: { $0.id == id })
                    self.trainings.append(newTraining)
                    
                    completion(.success(()))
                case .failure(let error):
                    completion(.failure(error))
                }
                
            }
        }
    }
    
    func deleteTraining(withID id: UUID, _ completion: @escaping (Result<Void, Error>) -> Void) {
        delay { [weak self] in
            guard let self = self else { return }
            self.trainings.removeAll(where: { $0.id == id })
            completion(.success(()))
        }
    }
    
    private func delay(_ action: @escaping EmptyCallback) {
        DispatchQueue.main.asyncAfter(deadline: .now() + self.delayTime) {
            action()
        }
    }
}
