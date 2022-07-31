//
//  UIApplication+.swift
//  SwimPal
//
//  Created by Bruno Benčević on 27.06.2022..
//

import UIKit

extension UIApplication {
    
    static var topMostViewController: UIViewController? {
        guard let keyWindow = UIApplication.shared.windows.filter({ $0.isKeyWindow }).first else { return nil }

        if var topController = keyWindow.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            
            return topController
        }
        
        return nil
    }
    
    static func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
