//
//  TutorialController.swift
//  lesson31_Auth_Flow
//
//  Created by Yurii Bosov on 10.07.2020.
//  Copyright © 2020 Bosov. All rights reserved.
//

import UIKit

//protocol TutorialControllerProtocol: NSObjectProtocol {
//    func tutorialControllerAppStarted(controller: TutorialController)
//}

class TutorialController: BaseViewController {

//    weak var delegate: TutorialControllerProtocol?
    
    var onAppStarted: ((TutorialController)->())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Tutorial"
    }
    
    @IBAction private func appStart() {
//        delegate?.tutorialControllerAppStarted(controller: self)
        onAppStarted?(self)
    }

}
