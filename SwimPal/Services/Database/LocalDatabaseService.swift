//
//  LocalDatabaseService.swift
//  SwimPal
//
//  Created by Bruno Benčević on 03.07.2022..
//

import Foundation

final class LocalDatabaseService: DatabaseServiceProtocol {
    
    @Dependency private var fileManagerService: FileManagerService
    
    init() {
        fileManagerService.completionOnMain = true
    }
    
    func fetchTrainings(userID: String, completion: @escaping (ServiceResult<[Training]>) -> Void) {
        let filePath = fileManagerService.createFilepath("trainings/\(userID)")
        
        if !fileManagerService.fileExists(at: filePath) {
            
            fileManagerService.save([Training](), at: filePath) { [weak self] error in
                if let error = error {
                    completion(.failure(error))
                } else {
                    self?.fileManagerService.load(filePath, completion: completion)
                }
            }
        } else {
            fileManagerService.load(filePath, completion: completion)
        }
    }
}
