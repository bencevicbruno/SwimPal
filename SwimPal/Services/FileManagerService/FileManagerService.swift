//
//  FileManagerService.swift
//  SwimPal
//
//  Created by Bruno Benčević on 03.07.2022..
//

import Foundation

final class FileManagerService {
    
    var completionOnMain = true
    
    private let fileManager = FileManager.default
    
    init() {
        
    }
    
    func fileExists(at url: URL) -> Bool {
        fileManager.fileExists(atPath: url.path)
    }
    
    func load<T>(_ url: URL, completion: @escaping (ServiceResult<T>) -> Void) where T: Decodable {
        guard let data = try? Data(contentsOf: url) else {
            return run {
                completion(.failure(FileManagerServiceError.fileNotFound))
            }
        }
        
        guard let decodedData = try? JSONDecoder().decode(T.self, from: data) else {
            return run {
                completion(.failure(FileManagerServiceError.dataCorrupted))
            }
        }
        
        completion(.success(decodedData))
    }
    
    func save<T>(_ t: T, at url: URL, completion: @escaping (FileManagerServiceError?) -> Void) where T: Encodable {
        guard let data = try? JSONEncoder().encode(t) else {
            return run {
                completion(FileManagerServiceError.cannotEncode)
            }
        }
        
        do {
            try fileManager.createDirectory(at: URL(fileURLWithPath: url.path.substringUntilLast("/"), isDirectory: true), withIntermediateDirectories: true)
        } catch {
            return run {
                completion(.cannotCreatePath)
            }
        }
        
        do {
            try data.write(to: url)
        } catch {
            return run {
                completion(FileManagerServiceError.cantSave)
            }
        }
        
        run {
            completion(nil)
        }
    }
    
    func createFilepath(_ fileName: String, fileExtension: String = ".json") -> URL {
        return fileManager.documentsDirectory.appendingPathComponent(fileName + fileExtension, isDirectory: false)
    }
}

private extension FileManagerService {
    
    func run(_ completion: @escaping EmptyCallback) {
        if completionOnMain {
            DispatchQueue.main.async {
                completion()
            }
        } else {
            completion()
        }
    }
}
