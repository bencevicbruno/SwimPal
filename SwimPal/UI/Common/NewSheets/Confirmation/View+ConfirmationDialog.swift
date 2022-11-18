//
//  View+ConfirmationDialog.swift
//  SwimPal
//
//  Created by Bruno Bencevic on 02.11.2022..
//

import SwiftUI

extension View {
    
    func confirmationDialog(_ dialogBinding: Binding<ConfirmationDialog?>) -> some View {
        ZStack(alignment: .bottom) {
            self
            
            if let dialog = dialogBinding.wrappedValue {
                ConfirmationDialogSheet(dialog: dialog, isVisible: .forVisibility(dialogBinding))
            }
        }
    }
}
