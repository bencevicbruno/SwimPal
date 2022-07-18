//
//  ActiveTraining.swift
//  SwimPal
//
//  Created by Bruno Benčević on 02.07.2022..
//

import Foundation

struct ActiveTraining {
    let category: Training.Category
    let excercises: [Training.Excercise]
    let time: Time?
    
    init(category: Training.Category, excercises: [Training.Excercise], time: Time? = nil) {
        self.category = category
        self.excercises = excercises
        self.time = time
    }
}
