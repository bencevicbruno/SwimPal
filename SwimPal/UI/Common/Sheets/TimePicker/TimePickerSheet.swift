//
//  TimePickerSheet.swift
//  SwimPal
//
//  Created by Bruno Benčević on 15.07.2022..
//

import SwiftUI

struct TimePickerSheet: View {
    
    @Binding var isVisible: Bool
    
    @State private var hoursValue: UInt = 0
    @State private var minutesValue: UInt = 0
    @State private var secondsvalue: UInt = 0
    
    private let data: TimePickerData
    
    var body: some View {
        SheetBase($isVisible) { dismiss in
            VStack(spacing: 0) {
                SheetTitle(data.title)
                    .padding(.top, 24)
                    .padding(.bottom, 12)
                
                pickers
                
                HStack(spacing: 24) {
                    SheetButton(data.cancelTitle, style: .secondary) {
                        dismiss {}
                    }
                    
                    SheetButton(data.okTitle) {
                        dismiss { data.action?(Time(hoursValue, .hours)
                            .and(minutesValue, .minutes)
                            .and(secondsvalue, .seconds)) }
                    }
                }
            }
            .padding(.horizontal, SheetUtils.horizontalPadding)
            .padding(.bottom, SheetUtils.bottomContentPadding)
            
        }
    }
    
    init(_ isVisible: Binding<Bool>, data: TimePickerData) {
        self._isVisible = isVisible
        self.data = data
        
        self.hoursValue = data.startingTime.hours
        self.minutesValue = data.startingTime.minutes
        self.secondsvalue = data.startingTime.seconds
    }
}

private extension TimePickerSheet {
    
    @ViewBuilder
    var pickers: some View {
        switch data.options {
        case .hoursAndMinutes:
           TimePickerTwoPickers(firstValue: $hoursValue, secondValue: $minutesValue)
        case .minutesAndSeconds:
            TimePickerTwoPickers(firstValue: $minutesValue, secondValue: $secondsvalue)
        }
    }
}

struct TimePickerSheet_Previews: PreviewProvider {
    static var previews: some View {
        ZStack(alignment: .bottom) {
            Color.yellow
            
            TimePickerSheet(.constant(true), data: .init(title: "Pick time", options: .minutesAndSeconds))
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}
