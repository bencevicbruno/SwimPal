//
//  TimePickerData.swift
//  SwimPal
//
//  Created by Bruno Benčević on 15.07.2022..
//

import SwiftUI

struct TimePickerData {
    let title: String
    let startingTime: Time
    let options: Options
    let okTitle: String
    let cancelTitle: String
    let action: ((Time) -> Void)?
    
    init(title: String, startingTime: Time = .init(5, .minutes), options: Options, okTitle: String = Localizable.ok, cancelTitle: String = Localizable.cancel, action: ((Time) -> Void)? = nil) {
        self.title = title
        self.startingTime = startingTime
        self.options = options
        self.okTitle = okTitle
        self.cancelTitle = cancelTitle
        self.action = action
    }
    
    enum Options {
        case hoursAndMinutes
        case minutesAndSeconds
    }
}

extension View {
    
    func timePickerSheet(_ data: Binding<TimePickerData?>) -> some View {
        let isVisible = Binding(
            get: { data.wrappedValue != nil },
            set: { value in
                if !value {
                    data.wrappedValue = nil
                }
            }
        )
        
        return ZStack {
            self
            
            if let data = data.wrappedValue {
                TimePickerSheet(isVisible, data: data)
            }
        }
    }
}
