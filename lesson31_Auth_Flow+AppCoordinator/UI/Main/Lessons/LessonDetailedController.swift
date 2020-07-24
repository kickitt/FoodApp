//
//  LessonDetailedController.swift
//  lesson31_Auth_Flow+AppCoordinator
//
//  Created by Yurii Bosov on 24.07.2020.
//  Copyright © 2020 Bosov. All rights reserved.
//

import UIKit

class LessonDetailedController: BaseViewController {

    var lesson: Lesson?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = lesson?.title
    }

}
