//
//  AddExerciseViewModel.swift
//  SwimPal
//
//  Created by Bruno Benčević on 13.07.2022..
//

import Foundation

final class AddExerciseViewModel: ObservableObject {
    
    var onDismissed: EmptyCallback?
    var onAddExercise: ((Training.Excercise) -> Void)?
    
    @Published var exerciseStyle: Training.Excercise.Style?
    @Published var value: Int?
    @Published var repetitions: Int = 1
    @Published var timeLimit: Time?
    
    @Published var optionsSheetData: NewOptionsSheetData?
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
        let options = Training.Excercise.Style.allCases.map { NewOptionsSheetItem.radioButton(title: $0.title, isSelected: exerciseStyle == $0) }
        
        optionsSheetData = .init(title: Localizable.select_exercise, options: options, onOptionSelected: { [weak self] option in
            self?.exerciseStyle = Training.Excercise.Style.allCases[option]
        })
    }
    
    func valueCardTapped() {
        guard let style = exerciseStyle else { return }
        
        if style.isMeasuredInMeters {
            valuePickerData = ValuePickerData(title: Localizable.choose_distance,
                                              items: stride(from: 25, to: 1025, by: 25).map { ValuePickerSheetItem(title: "\($0) \(Localizable.meters)", value: $0) }) { [weak self] newValue in
                self?.value = newValue
            }
        } else {
            var values: [Int] = []
            
            for i in 1...30 {
                values.append(i)
            }
            
            valuePickerData = ValuePickerData(title: Localizable.pick_time,
                                              items: (1...30).map { ValuePickerSheetItem(title: "\($0) \($0 == 1 ? Localizable.minute : Localizable.minutes)", value: $0) }) { [weak self] newValue in
                self?.value = newValue
            }
        }
    }
    
    
    func timeLimitTapped() {
        timePickerData = .init(title: Localizable.time_limit, startingTime: timeLimit, options: .minutesAndSeconds) { [weak self] newTimeLimit in
            
            self?.timeLimit = newTimeLimit
        }
    }
    
    func dismiss() {
        onDismissed?()
    }
    
    var isFormValid: Bool {
        exerciseStyle != nil && value != nil
    }
    
    func addExerciseTapped() {
        guard isFormValid else { return }
        onAddExercise?(.init(style: exerciseStyle!, value: value!, numberOfRepetitions: repetitions, timeLimit: timeLimit, isInProgress: false))
    }
}
