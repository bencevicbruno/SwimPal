//
//  TrainingExcerciseList.swift
//  SwimPal
//
//  Created by Bruno Benčević on 30.06.2022..
//

import SwiftUI

struct TrainingExcerciseList: View {
    
    let excercises: [Training.Excercise]
    
    var body: some View {
        LazyVStack(spacing: 8) {
            ForEach(excercises) {
                TrainingExcerciseCell(excercise: $0)
                    .opacity($0.isInProgress ? 1 : 0.8)
                    .scaleEffect(x: $0.isInProgress ? 1 : 0.8, anchor: .leading)
                    .id($0.id)
            }
        }
        .foregroundColor(.white)
    }
}

struct TrainingExcerciseList_Previews: PreviewProvider {
    static var previews: some View {
        var excercises = Training.Category.lifeguard.excercises
        excercises[0].isInProgress = true
        
        return TrainingExcerciseList(excercises: excercises)
    }
}
