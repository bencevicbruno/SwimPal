//
//  DatabaseServiceProtocol.swift
//  SwimPal
//
//  Created by Bruno Benčević on 03.07.2022..
//

import Foundation

protocol DatabaseServiceProtocol {
    
    func fetchTrainings(userID: String, completion: @escaping (ServiceResult<[Training]>) -> Void)
}
