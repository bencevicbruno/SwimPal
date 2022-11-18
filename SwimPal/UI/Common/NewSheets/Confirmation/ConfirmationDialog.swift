//
//  ConfirmationDialog.swift
//  SwimPal
//
//  Created by Bruno Bencevic on 02.11.2022..
//

import Foundation

struct ConfirmationDialog: SheetDialog {
    let title: String
    let message: String
    let confirmTitle: String
    let declineTitle: String
    let confirmAction: EmptyCallback
    let declineAction: EmptyCallback?
    let dismissAction: EmptyCallback?
    let dismissOnOverlayTap: Bool
    
    init(title: String, message: String, confirmTitle: String = "Confirm", declineTitle: String = "Decline", confirmAction: @escaping EmptyCallback = {}, declineAction: EmptyCallback? = nil, dismissAction: EmptyCallback? = nil, dismissOnOverlayTap: Bool = true) {
        self.title = title
        self.message = message
        self.confirmTitle = confirmTitle
        self.declineTitle = declineTitle
        self.confirmAction = confirmAction
        self.declineAction = declineAction
        self.dismissAction = dismissAction
        self.dismissOnOverlayTap = dismissOnOverlayTap
    }
}

extension ConfirmationDialog {
    
    static var previewExample = ConfirmationDialog(
        title: "Preview Example",
        message: "This should be a message indicating the user that they should either confirm or deny the following action.")
}
