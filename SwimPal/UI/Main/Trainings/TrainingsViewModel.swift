//
//  TrainingsViewModel.swift
//  SwimPal
//
//  Created by Bruno Benčević on 02.06.2022..
//

import SwiftUI

final class TrainingsViewModel: ObservableObject {
    
    @Published var trainings: [Training] = []
    @Published var error: ErrorData?
    @Published var isActivityRunning = false
    
    init() {
        trainings = (1...10).map { Training(name: "training \($0)", date: .now, time: 12, latitude: 0, longitude: 0, location: "") }
    }
}
