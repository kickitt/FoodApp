//
//  LessonsController.swift
//  lesson31_Auth_Flow+AppCoordinator
//
//  Created by Yurii Bosov on 17.07.2020.
//  Copyright © 2020 Bosov. All rights reserved.
//

import UIKit

class LessonsController: BaseViewController {

    override func setupController() {
        self.title = "All lessons"
        self.tabBarItem = UITabBarItem(title: "Lessons",
                                       image: R.image.allLessonsIcon(),
                                       tag: 0)
    }

}
