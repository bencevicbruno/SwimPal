//
//  ActiveTrainingViewModel.swift
//  SwimPal
//
//  Created by Bruno Benčević on 28.06.2022..
//

import SwiftUI

final class ActiveTrainingViewModel: ObservableObject {
    
    var onTrainingEnded: EmptyCallback?
    var onScrollTo: ((Int) -> Void)?
    var onGoToSaveTraining: ((ActiveTraining) -> Void)?
    
    @Published var excercises: [Training.Excercise]
    @Published var currentExcerciseIndex = 0
    @Published var timerCounter: UInt = 0
    @Published var confirmationData: ConfirmationData?
    
    private var activeTraining: ActiveTraining
    private var timer: Timer?
    
    init(activeTraining: ActiveTraining) {
        self.activeTraining = activeTraining
        self.excercises = activeTraining.excercises
        
        excercises[0].isInProgress = true
    }
    
    var isLastExcecise: Bool {
        currentExcerciseIndex == excercises.count - 1
    }
    
    @objc func timerClocked() {
        timerCounter += 1
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerClocked), userInfo: nil, repeats: true)
    }
    
    func stopTimer() {
        timer = nil
    }
    
    func nextTapped() {
        if isLastExcecise {
            finishTraining()
        } else {
            withAnimation {
                excercises[currentExcerciseIndex].isInProgress = false
                excercises[currentExcerciseIndex + 1].isInProgress = true
                onScrollTo?(currentExcerciseIndex + 1)
            }
            
            currentExcerciseIndex += 1
        }
    }
    
    func finishTraining() {
        onGoToSaveTraining?(ActiveTraining(category: activeTraining.category, excercises: activeTraining.excercises, time: .init(timerCounter, .seconds)))
    }
    
    func endTraining() {
        stopTimer()
        
        confirmationData = ConfirmationData(title: Localizable.confirmation_cancel_training_title, message: Localizable.confirmation_cancel_training_message, cancelTitle: Localizable.no, confirmTitle: Localizable.yes) { [weak self] in
            self?.onTrainingEnded?()
        }
    }
}
