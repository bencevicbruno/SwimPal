//
//  DataService.swift
//  SwimPal
//
//  Created by Bruno Benčević on 06.08.2022..
//

import Foundation

final class DataService: DataServiceProtocol {
    
    var runCompletionOnMainThread: Bool = true
    
    init() {
        
    }
    
    func fetch<T>(from urlString: String, completion: @escaping (Result<T, Error>) -> Void) where T: Decodable {
        inBackground { [weak self] in
            guard let self = self else { return }
            
            guard let url = URL(string: urlString) else {
                return self.run {
                    completion(.failure(DataServiceError.invalidURL))
                }
            }
            
            URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
                guard let self = self else { return }
                
                if let error = error {
                    return self.run {
                        completion(.failure(error))
                    }
                }
                
                guard let data = data else {
                    return self.run {
                        completion(.failure(DataServiceError.noData))
                    }
                }
                
                let response: T
                do {
                    response = try JSONDecoder().decode(T.self, from: data)
                } catch (let error) {
                    return self.run {
                        completion(.failure(error))
                    }
                }
                
                self.run {
                    completion(.success(response))
                }
            }
            .resume()
        }
    }
}

private extension DataService {
    
    func run(_ completion: @escaping EmptyCallback) {
        if runCompletionOnMainThread {
            DispatchQueue.main.async {
                completion()
            }
        } else {
            completion()
        }
    }
}
