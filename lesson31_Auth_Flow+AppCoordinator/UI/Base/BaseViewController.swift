//
//  BaseViewController.swift
//  lesson31_Auth_Flow
//
//  Created by Yurii Bosov on 10.07.2020.
//  Copyright © 2020 Bosov. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setupController()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupController()
    }
    
    deinit {
        print("deinit \(self.className)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    func setupController() {
        
    }
    
    func setupView() {
        self.view.backgroundColor = UIColor(red: 53/255, green: 132/255, blue: 159/255, alpha: 1)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
