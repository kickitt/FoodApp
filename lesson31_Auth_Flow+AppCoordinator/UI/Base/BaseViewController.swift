//
//  BaseViewController.swift
//  lesson31_Auth_Flow
//
//  Created by Yurii Bosov on 10.07.2020.
//  Copyright © 2020 Bosov. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    deinit {
        print("deinit \(self.className)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    func setup() {
        self.view.backgroundColor = UIColor(red: 53/255, green: 132/255, blue: 159/255, alpha: 1)
    }

}
