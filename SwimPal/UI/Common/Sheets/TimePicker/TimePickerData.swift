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
    
    init(title: String, startingTime: Time? = nil, options: Options, okTitle: String = Localizable.ok, cancelTitle: String = Localizable.cancel, action: ((Time) -> Void)? = nil) {
        self.title = title
        self.startingTime = startingTime ?? .zero
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
    
    func timePickerSheet(_ dataBinding: Binding<TimePickerData?>) -> some View {
        ZStack {
            self
            
            if let data = dataBinding.wrappedValue {
                TimePickerSheet(.forVisibility(dataBinding), data: data)
            }
        }
    }
}
