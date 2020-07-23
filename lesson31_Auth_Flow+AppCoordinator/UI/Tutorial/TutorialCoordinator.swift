//
//  TutorialCoordinator.swift
//  lesson31_Auth_Flow+AppCoordinator
//
//  Created by Олег Чудновский on 22.07.2020.
//  Copyright © 2020 Bosov. All rights reserved.
//

import UIKit
import Rswift

class TutorialCoordinator: AppCoordinator  {
    var onTutorialIsFinish: (()->())?
    
    override func start() {
       startTutorial()
    }
    
    private func startTutorial() {
        
    }
}
