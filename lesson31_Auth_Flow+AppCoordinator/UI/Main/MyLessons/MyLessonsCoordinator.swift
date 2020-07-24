//
//  MyLessonsCoordinator.swift
//  lesson31_Auth_Flow+AppCoordinator
//
//  Created by Yurii Bosov on 17.07.2020.
//  Copyright © 2020 Bosov. All rights reserved.
//

import UIKit

class MyLessonsCoordinator: Coordinator {
    
    let rootController = NavigationController()
    
    override func startFlow() {
        if let controller = R.storyboard.myLessons.myLessonsController() {
            
            controller.viewModel = MyLessonsViewModel()
            controller.onSelectedLesson = { [weak self] lesson in
                self?.openLessonDetailed(lesson)
            }
            rootController.viewControllers = [controller]
        }
    }
    
    private func openLessonDetailed(_ lesson: Lesson) {
        if let controller = R.storyboard.lessons.lessonDetailedController() {
            controller.lesson = lesson
            rootController.pushViewController(controller, animated: true)
        }
    }

}
