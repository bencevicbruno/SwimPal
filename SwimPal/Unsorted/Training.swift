//
//  Training.swift
//  SwimPal
//
//  Created by Bruno Benčević on 22.06.2022..
//

import Foundation
import CoreLocation

struct Training: Codable {
    let name: String
    let date: Date
    let time: Time
    let location: Training.Location
    let category: Training.Category
    let excercises: [Training.Excercise]
}
