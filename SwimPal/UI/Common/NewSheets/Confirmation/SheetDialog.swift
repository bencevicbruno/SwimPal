//
//  SheetDialog.swift
//  SwimPal
//
//  Created by Bruno Bencevic on 03.11.2022..
//

import Foundation

protocol SheetDialog {
    var dismissAction: EmptyCallback? { get }
    var dismissOnOverlayTap: Bool { get }
}
