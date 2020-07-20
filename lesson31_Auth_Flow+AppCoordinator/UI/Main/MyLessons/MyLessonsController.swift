//
//  MyLessonsController.swift
//  lesson31_Auth_Flow+AppCoordinator
//
//  Created by Yurii Bosov on 17.07.2020.
//  Copyright © 2020 Bosov. All rights reserved.
//

import UIKit

class MyLessonsController: BaseViewController {

    override func setupController() {
        self.title = "My lessons"
        self.tabBarItem = UITabBarItem(title: "My lessons",
                                       image: R.image.myLessons(),
                                       tag: 0)
    }
}
