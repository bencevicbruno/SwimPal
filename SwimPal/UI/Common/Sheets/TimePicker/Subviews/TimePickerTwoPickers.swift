//
//  TimePickerTwoPickers.swift
//  SwimPal
//
//  Created by Bruno Benčević on 16.07.2022..
//

import SwiftUI

struct TimePickerTwoPickers: View {
    
    @Binding var firstValue: UInt
    @Binding var secondValue: UInt
    
    var body: some View {
        HStack(spacing: 0) {
            VStack(spacing: 0) {
                Picker("FirstPicker", selection: $firstValue) {
                    ForEach(UInt(0)..<UInt(24), id: \.self) {
                        Text("\($0)")
                            .style(.roboto(.display1, .bold), .black)
                            .tag($0)
                            .id($0)
                    }
                }
            }
            .frame(width: (UIScreen.width - 50) / 2, height: 60)
            .clipped()
            
            Capsule()
                .fill(Color.gray242)
                .frame(width: 2, height: 60)
                .padding(.horizontal, 11)
            
            VStack(spacing: 0) {
                Picker("SecondPicker", selection: $secondValue) {
                    ForEach(UInt(0)..<UInt(59), id: \.self) {
                        Text("\($0)")
                            .style(.roboto(.display1, .bold), .black)
                            .tag($0)
                            .id($0)
                    }
                }
            }
            .frame(width: (UIScreen.width - 50) / 2, height: 60)
            .clipped()
        }
        .padding(.bottom, 10)
        .pickerStyle(.wheel)
        .clipped()
    }
}

struct TimePickerTwoPickers_Previews: PreviewProvider {
    static var previews: some View {
        TimePickerTwoPickers(firstValue: .constant(0), secondValue: .constant(0))
    }
}
