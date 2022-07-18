//
//  ValuePickerSheetItemProtocol.swift
//  SwimPal
//
//  Created by Bruno Benčević on 17.07.2022..
//

import Foundation

struct ValuePickerSheetItem<T: Hashable>: Identifiable {
    let id = UUID()
    let title: String
    let value: T
}
