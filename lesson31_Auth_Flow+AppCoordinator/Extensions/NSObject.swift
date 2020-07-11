//
//  NSObject.swift
//  lesson31_Auth_Flow
//
//  Created by Yurii Bosov on 10.07.2020.
//  Copyright © 2020 Bosov. All rights reserved.
//

import Foundation

extension NSObject {
    var className: String {
        return String(describing: self)
    }
    
    static var className: String {
        return String(describing: self)
    }
}
