//
//  FieldsFormatter.swift
//  lesson31_Auth_Flow+AppCoordinator
//
//  Created by Roman Berezin on 24.07.2020.
//  Copyright © 2020 Bosov. All rights reserved.
//

import UIKit

class FieldsFormatter {
    
    static func nameFormatter(_ field: UITextField) {
        
        if let value = field.text?.trimmingCharacters(in: .whitespacesAndNewlines), value.count != 0 {
            
            var count = 0
            var newValue = ""
            for v in value {
                if v == " " {
                    if count == 0 {
                        newValue.append(v)
                    }
                    count += 1
                } else {
                    newValue.append(v)
                }
            }
            field.text = newValue.capitalized
        }
    }
    
    static func phoneFormatter (_ field: UITextField) {
        
//        let prefix = "+"
//        if let value = field.text?.trimmingCharacters(in: .whitespacesAndNewlines), value.count != 0 {
//
//            var count = 0
//            var number = ""
//            var codeNumber = ""
//            var countryNumber = ""
            
//            for v in value.reversed() {
//                if count < 7 {
//                    number.insert(v, at: number.startIndex)
//                } else if count == 7 {
//                    codeNumber.insert(")", at: codeNumber.startIndex)
//                } else if count > 7 && count < 11{
//                    codeNumber.insert(v, at: codeNumber.startIndex)
//                } else if count == 11 {
//                    codeNumber.insert("(", at: codeNumber.startIndex)
//                } else if count > 11 {
//                    countryNumber.insert(v, at: countryNumber.startIndex)
//                }
//                count += 1
//            }
//            field.text  = prefix + countryNumber + codeNumber + number
//        }
    }
    
}

