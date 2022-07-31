//
//  TextFieldValidator.swift
//  SwimPal
//
//  Created by Bruno Benčević on 20.07.2022..
//

import Foundation

enum TextFieldValidator {
    
    static let upperCase: TextFieldValidatorProtocol = UppercaseValidator()
    static let lowerCase: TextFieldValidatorProtocol = LowercaseValidator()
    static let number: TextFieldValidatorProtocol = NumberValidator()
    static let integer: TextFieldValidatorProtocol = IntegerValidator()
    static let nonEmpty: TextFieldValidatorProtocol = NonEmptyValidator()
    
    static func length(_ length: Int) -> TextFieldValidatorProtocol {
        return LengthValidator(length: length)
    }
}

protocol TextFieldValidatorProtocol {
    
    func isValid(_ string: String) -> Bool
    
    var message: String { get }
}

struct UppercaseValidator: TextFieldValidatorProtocol {
    
    let message: String = "Field must contain only uppercase letters."
    
    func isValid(_ string: String) -> Bool {
        return string.uppercased() == string
    }
}

struct LowercaseValidator: TextFieldValidatorProtocol {
    
    let message: String = "Field must contain only lowercase letters."
    
    func isValid(_ string: String) -> Bool {
        return string.lowercased() == string
    }
}

struct NumberValidator: TextFieldValidatorProtocol {
    
    let message: String = "Field must contain a number."
    
    func isValid(_ string: String) -> Bool {
        return Float(string) != nil
    }
}

struct IntegerValidator: TextFieldValidatorProtocol {
    
    let message: String = "Field must contain an integer."
    
    func isValid(_ string: String) -> Bool {
        return Int(string) != nil
    }
}

struct LengthValidator: TextFieldValidatorProtocol {
    
    let length: Int
    let message: String
    
    init(length: Int) {
        self.length = length
        self.message = "Field must contain at most \(length) characters."
    }
    
    func isValid(_ string: String) -> Bool {
        return string.count <= length
    }
}

struct NonEmptyValidator: TextFieldValidatorProtocol {
    
    var message: String = "Field must not be empty."
    
    func isValid(_ string: String) -> Bool {
        return !string.isEmpty
    }
}
