//
//  Lesson.swift
//  lesson31_Auth_Flow+AppCoordinator
//
//  Created by Yurii Bosov on 24.07.2020.
//  Copyright © 2020 Bosov. All rights reserved.
//

import Foundation

struct Lesson {
    let title: String
    
    static func testData() -> [Lesson] {
        return [
            Lesson(title: "1"),
            Lesson(title: "2"),
            Lesson(title: "3"),
            Lesson(title: "4"),
            Lesson(title: "5")
        ]
    }
}
