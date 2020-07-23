//
//  AppDelegate.swift
//  lesson31_Auth_Flow
//
//  Created by Yurii Bosov on 10.07.2020.
//  Copyright © 2020 Bosov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let window = UIWindow(frame: UIScreen.main.bounds)
        let settings = AppSettings()
        let appCoordinator = AppCoordinator(window: window,
                                            settings: settings)
        
        self.window = window
        self.appCoordinator = appCoordinator
        
        appCoordinator.startFlow()
        window.makeKeyAndVisible()
        
        return true
    }

}

