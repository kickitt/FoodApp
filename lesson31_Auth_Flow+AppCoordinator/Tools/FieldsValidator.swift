//
//  FieldsValidator.swift
//  lesson31_Auth_Flow+AppCoordinator
//
//  Created by Roman Berezin on 15.07.2020.
//  Copyright © 2020 Bosov. All rights reserved.
//

import Foundation
import UIKit

final class FieldsValidator {
    
    static func notValidField(_ field: UITextField) {
        field.layer.borderWidth = 0.8
        field.layer.borderColor = UIColor.red.cgColor
    }
    
    static func isNameValid(_ field: UITextField) -> Bool{
        if let value = field.text, value.count != 0 {
            do {
                if try NSRegularExpression(pattern: "^[A-Za-z]+ [A-Za-z]", options: .caseInsensitive).firstMatch(in: value, options: [], range: NSRange(location: 0, length: value.count)) == nil {
                    notValidField(field)
                    return false
                }
            } catch {
                return false
            }
        }
        return true
    }
    
    static func isEmailValid(_ field: UITextField) -> Bool {
        if let value = field.text, value.count != 0 {
            do {
                if try NSRegularExpression(pattern: "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$", options: .caseInsensitive).firstMatch(in: value, options: [], range: NSRange(location: 0, length: value.count)) == nil {
                    notValidField(field)
                    return false
                }
            } catch {
                return false
            }
        }
        return true
    }
    
    
    static func isPhoneValid(_ field: UITextField) -> Bool {
        if let value = field.text, value.count != 0 {
            do {
                if try NSRegularExpression(pattern: "^[0-9]{10,13}$", options: .caseInsensitive).firstMatch(in: value, options: [], range: NSRange(location: 0, length: value.count)) == nil {
                    notValidField(field)
                    return false
                }
            } catch {
                return false
            }
        }
        return true
    }

    
    static func isPassValid(_ field: UITextField) -> Bool {
        if let value = field.text, value.count != 0 {
                   do {
                       if try NSRegularExpression(pattern: /*"^[A-Z0-9a-z._%+-].{8,}$"*/ "(?=.*[a-z])(?=.*[A-Z]).{8,}", options: .caseInsensitive).firstMatch(in: value, options: [], range: NSRange(location: 0, length: value.count)) == nil {
                           notValidField(field)
                           return false
                       }
                   } catch {
                       return false
                   }
               }
        return true
    }
    
    static func isPassConfirmed(_ passField: UITextField, _ confirmPassField: UITextField) -> Bool {
        if let firstValue = passField.text, let secondValue = confirmPassField.text, firstValue != secondValue {
            notValidField(confirmPassField)
            return false
        }
        return true
    }
}
