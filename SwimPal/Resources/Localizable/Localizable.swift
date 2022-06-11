//
//  Localizable.swift
//  SwimPal
//
//  Created by Bruno Benčević on 10.06.2022..
//

import Foundation

enum Localizable {
    
    static var login: String { "login".localized() }
    static var register: String { "register".localized() }
    static var email: String { "email".localized() }
    static var password: String { "password".localized() }
    static var repeat_password: String { "repeat_password".localized() }
    static var register_msg: String { "register_msg" }
}

fileprivate extension String {
    
    func localized() -> String {
        @Dependency var persistenceService: PersistenceServiceProtocol
        
        let lang = persistenceService.language.rawValue
        
        let path = Bundle.main.path(forResource: lang, ofType: "lproj")
        let bundle = Bundle(path: path!)
        
        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    }
}
