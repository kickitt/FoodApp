//
//  User.swift
//  lesson31_Auth_Flow
//
//  Created by Yurii Bosov on 10.07.2020.
//  Copyright © 2020 Bosov. All rights reserved.
//

import Foundation

struct User: Codable {
    let name: String
    let email: String
    let password: String
    let photo: String?
}
