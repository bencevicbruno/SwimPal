//
//  TrainingsService.swift
//  SwimPal
//
//  Created by Bruno Benčević on 02.08.2022..
//

import Foundation

final class TrainingsService: TrainingsServiceProtocol {
    
    @Service private var persistenceService: PersistenceServiceProtocol
    @Service private var fileManagerSevice: FileManagerService
    
    init() {
        fileManagerSevice.runCompletionOnMainThread = true
    }
    
    func fetchTrainings(_ completion: @escaping (Result<[Training], Error>) -> Void) {
        guard let userID = persistenceService.user?.id else { return }
        
        fileManagerSevice.loadAll("\(userID)/", completion: completion)
    }
    
    func fetchTraining(withID id: UUID, _ completion: @escaping (Result<Training, Error>) -> Void) {
        guard let userID = persistenceService.user?.id else { return }
        
        fileManagerSevice.load("\(userID)/\(id.uuidString)", completion: completion)
    }
    
    func saveTraining(_ training: Training, _ completion: @escaping (Result<Void, Error>) -> Void) {
        guard let userID = persistenceService.user?.id else { return }
        
        fileManagerSevice.save(training, at: "\(userID)/\(training.id.uuidString)", completion: completion)
    }
    
    func editTraining(withID id: UUID, with newData: EditTrainingModel, _ completion: @escaping (Result<Void, Error>) -> Void) {
        fetchTraining(withID: id) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let training):
                let newTraining = training.withUpdatedInfo(name: newData.name, location: newData.location, notes: newData.notes)
                self.saveTraining(newTraining, completion)
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func deleteTraining(withID id: UUID, _ completion: @escaping (Result<Void, Error>) -> Void) {
        fatalError("Not implemented!")
    }
}
