//
//  DataServiceProtocol.swift
//  SwimPal
//
//  Created by Bruno Benčević on 27.06.2022..
//

import Foundation

protocol DataServiceProtocol {
    
    func fetch<T>(_ resource: Resource<T>, _ completion: @escaping (DataServiceResult<T>) -> Void)
    
}

struct Request<T> where T: Encodable {
    let path: String
    let httpMethod: HTTPMethod = .get
    let parameters: [String: Any] = [:]
    let body: T?
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

enum DataServiceError: Error {
    case invalidURL
    case unableToEncodeRequest(Error)
    case urlSession(Error)
    case noData
    case unableToDecodeResponse(Error)
}

class DataService {
    
    let baseURL: String = "smth"
    
    private var interceptors: [RequestInterceptorProtocol] = []
    
    init() {
        
    }
    
    func fetch<T, U>(_ request: Request<T>, completion: @escaping (Result<U, DataServiceError>) -> Void) where T: Encodable, U: Decodable {
        guard let url = URL(string: baseURL + request.path + "?" + request.parameters.encodedAsURLParameters) else {
            return completion(.failure(.invalidURL))
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.httpMethod.rawValue
        
        if let dataToEncode = request.body {
            do {
                urlRequest.httpBody = try JSONEncoder().encode(dataToEncode)
            } catch (let error) {
                return completion(.failure(.unableToEncodeRequest(error)))
            }
        }
        
        createRequest(&urlRequest, completion: completion)
    }
    
    private func createRequest<U>(_ request: inout URLRequest, completion: @escaping (Result<U, DataServiceError>) -> Void) where U: Decodable {
        interceptors.forEach { interceptor in
            interceptor.intercept(&request)
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                return completion(.failure(.urlSession(error)))
            }
            
            guard let data = data else {
                return completion(.failure(.noData))
            }
            
            do {
                let decodedData = try JSONDecoder().decode(U.self, from: data)
                completion(.success(decodedData))
            } catch (let error) {
                return completion(.failure(.unableToDecodeResponse(error)))
            }
        }.resume()
    }
}
