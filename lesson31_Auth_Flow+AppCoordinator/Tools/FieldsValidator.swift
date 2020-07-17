//
//  FieldsValidator.swift
//  lesson31_Auth_Flow+AppCoordinator
//
//  Created by Roman Berezin on 15.07.2020.
//  Copyright © 2020 Bosov. All rights reserved.
//

import Foundation

final class FieldsValidator {
    
    static func isNameValid(_ value: String) -> Bool {
        do {
            if try NSRegularExpression(pattern: "^[A-Za-z]+ [A-Za-z]", options: .caseInsensitive).firstMatch(in: value, options: [], range: NSRange(location: 0, length: value.count)) == nil {
                return false
            }
        } catch {
            return false
        }
        return true
    }
    
   static func isEmailValid(_ value: String) -> Bool {
        do {
            if try NSRegularExpression(pattern: "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$", options: .caseInsensitive).firstMatch(in: value, options: [], range: NSRange(location: 0, length: value.count)) == nil {
                return false
            }
        } catch {
            return false
        }
        return true
    }
    
    static func isPhoneValid(_ value: String) -> Bool {
//        do {
//            if try NSRegularExpression(pattern: "^[0-9]{2,4}$", options: .caseInsensitive).firstMatch(in: value, options: [], range: NSRange(location: 0, length: value.count)) == nil {
//                return false
//            }
//        } catch {
//            return false
//        }
//        return true
        let PHONE_REGEX = "^\\d{3}\\d{3}\\d{4}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result = phoneTest.evaluate(with: value)
        return result
    }
    
    static func isPassValid(_ value: String) -> Bool {
        if value.count < 8 {
            return false
        }
        return true
    }
    
    static func isPassConfirmed(_ passValue: String, _ confirmingPassValue: String) -> Bool {
        if passValue != confirmingPassValue {
            return false
        }
        return true
    }
}
