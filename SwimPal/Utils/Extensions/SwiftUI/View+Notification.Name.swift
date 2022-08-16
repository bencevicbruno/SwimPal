//
//  View+Notification.Name.swift
//  SwimPal
//
//  Created by Bruno Benčević on 02.08.2022..
//

import SwiftUI

extension View {
    
    func onReceive(_ notification: Notification.Name, _ completion: @escaping EmptyCallback) -> some View {
        self.onReceive(NotificationCenter.default.publisher(for: notification)) { _ in
            completion()
        }
    }
}
