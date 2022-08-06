//
//  FileManagerService.swift
//  SwimPal
//
//  Created by Bruno Benčević on 03.07.2022..
//

import Foundation

final class FileManagerService {
    
    var runCompletionOnMainThread: Bool = true
    private let fileManager = FileManager.default
    
    init() {
        
    }
    
    func fileExists(at url: URL) -> Bool {
        fileManager.fileExists(atPath: url.absoluteString)
    }
    
    func directoryExists(at url: URL) -> Bool {
        var isDirectory: ObjCBool = false
        let exists = fileManager.fileExists(atPath: url.absoluteString, isDirectory: &isDirectory)
        
        return exists && isDirectory.boolValue
    }
    
    func createDirectory(at url: URL) throws {
        try fileManager.createDirectory(at: url, withIntermediateDirectories: true)
    }
    
    func load<T>(_ path: String, completion: @escaping (Result<T, Error>) -> Void) where T: Decodable {
        inBackground { [weak self] in
            guard let self = self else { return }
            let url = self.filepath(path)
            
            url.access()
            let data: Data
            do {
                data = try Data(contentsOf: url)
            } catch {
                debugError("Unable to read contents of \(url)", error)
                return self.runCompleton {
                    completion(.failure(FileManagerServiceError.fileNotFound))
                }
            }
            
            let decodedData: T
            do {
                decodedData = try JSONDecoder().decode(T.self, from: data)
            } catch {
                debugError("Unable to decoded data of \(url)", error)
                return self.runCompleton {
                    completion(.failure(FileManagerServiceError.dataCorrupted))
                }
            }
            
            url.stopAccess()
            self.runCompleton {
                completion(.success(decodedData))
            }
        }
    }
    
    func loadAll<T>(_ path: String, completion: @escaping (Result<[T], Error>) -> Void) where T: Decodable {
        inBackground { [weak self] in
            guard let self = self else { return }
            let url = self.dirpath(path)
            
            if !self.directoryExists(at: url) {
                do {
                    try self.createDirectory(at: url)
                } catch {
                    debugError("Unable to create directory \(url)")
                    return self.runCompleton {
                        completion(.failure(FileManagerServiceError.cannotCreatePath))
                    }
                }
            }
            
            let fileURLS: [String]
            do {
                let url = URL(string: String(url.absoluteString.dropFirst("file://".count)))!
                url.access()
                fileURLS = try self.fileManager.contentsOfDirectory(atPath: url.absoluteString)
                url.stopAccess()
            } catch {
                debugError("Unable to get contents of \(url)", error)
                return self.runCompleton {
                    completion(.failure(FileManagerServiceError.filesNotFound))
                }
            }
            
            var results: [T] = []
            
            for fileURL in fileURLS {
                let fullFileURL = url.appendingPathComponent(fileURL)
                
                fullFileURL.access()
                let data: Data
                do {
                    data = try Data(contentsOf: url)
                } catch {
                    debugError("Unable to read contents of \(url)", error)
                    return self.runCompleton {
                        completion(.failure(FileManagerServiceError.fileNotFound))
                    }
                }
                
                let decodedData: T
                do {
                    decodedData = try JSONDecoder().decode(T.self, from: data)
                } catch {
                    debugError("Unable to decoded data of \(url)", error)
                    return self.runCompleton {
                        completion(.failure(FileManagerServiceError.dataCorrupted))
                    }
                }
                
                results.append(decodedData)
                fullFileURL.stopAccess()
                
            }
            
            self.runCompleton {
                completion(.success(results))
            }
        }
    }
    
    func save<T>(_ t: T, at path: String, completion: @escaping (Result<Void, Error>) -> Void) where T: Encodable {
        inBackground { [weak self] in
            guard let self = self else { return }
            let url = self.filepath(path)
            
            url.access()
            guard let data = try? JSONEncoder().encode(t) else {
                return self.runCompleton {
                    completion(.failure(FileManagerServiceError.cannotEncode))
                }
            }
            
            do {
                try data.write(to: url)
            } catch(let error) {
                print(error)
                return self.runCompleton {
                    completion(.failure(FileManagerServiceError.cantSave))
                }
            }
            
            url.stopAccess()
            self.runCompleton {
                completion(.success(()))
            }
        }
    }
    
    private func filepath(_ fileName: String, extension: String = ".json") -> URL {
        return fileManager.documentsDirectory.appendingPathComponent(fileName + `extension`, isDirectory: false)
    }
    
    private func dirpath(_ directoryName: String) -> URL {
        return fileManager.documentsDirectory.appendingPathComponent(directoryName, isDirectory: true)
    }
}

private extension FileManagerService {
    
    func runCompleton(_ completion: @escaping EmptyCallback) {
        if runCompletionOnMainThread {
            DispatchQueue.main.async {
                completion()
            }
        } else {
            completion()
        }
    }
}
