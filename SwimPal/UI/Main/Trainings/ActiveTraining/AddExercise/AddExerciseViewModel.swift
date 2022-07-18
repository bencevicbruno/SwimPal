//
//  AddExerciseViewModel.swift
//  SwimPal
//
//  Created by Bruno Benčević on 13.07.2022..
//

import Foundation

final class AddExerciseViewModel: ObservableObject {
    
    var onDismissed: EmptyCallback?
    
    @Published var exerciseStyle: Training.Excercise.Style?
    @Published var value: Int?
    @Published var repetitions: Int = 1
    @Published var timeLimit: Time?
    
    @Published var optionsData: OptionsData?
    @Published var timePickerData: TimePickerData?
    @Published var valuePickerData: ValuePickerData<Int>?
    
    var availableRepetitions: [Int] {
        var result: [Int] = []
        
        result.append(contentsOf: 1...50)
        
        return result
    }
    
    init() {
        
    }
    
    // MARK: - User Interactions
    
    func exerciseStyleTapped() {
        let options = Training.Excercise.Style.allCases.map { OptionsData.Item(iconName: "", title: $0.title) }
        
        optionsData = .init(title: "Pick an Exercise", items: options) { [weak self] index in
            self?.exerciseStyle = Training.Excercise.Style.allCases[index]
        }
    }
    
    func valueCardTapped() {
        guard let style = exerciseStyle else { return }
        
        if style.isMeasuredInMeters {
            valuePickerData = ValuePickerData(title: "Pick distance",
                                              items: stride(from: 25, to: 1025, by: 25).map { ValuePickerSheetItem(title: "\($0) meters", value: $0) })
        } else {
            var values: [Int] = []
            
            for i in 1...30 {
                values.append(i)
            }
            
            valuePickerData = ValuePickerData(title: "Pick time",
                                              items: (1...30).map { ValuePickerSheetItem(title: "\($0) \($0 == 1 ? "minute" : "minutes")", value: $0) })
        }
    }
    
    
    func timeLimitTapped() {
        timePickerData = .init(title: "Time Limit", startingTime: timeLimit ?? .init(5, .seconds), options: .minutesAndSeconds) { [weak self] newTimeLimit in
            self?.timeLimit = newTimeLimit
        }
    }
    
    func dismiss() {
        onDismissed?()
    }
}
