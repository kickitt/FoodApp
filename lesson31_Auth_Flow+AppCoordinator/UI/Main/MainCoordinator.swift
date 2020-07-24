//
//  MainCoordinator.swift
//  lesson31_Auth_Flow+AppCoordinator
//
//  Created by Yurii Bosov on 17.07.2020.
//  Copyright © 2020 Bosov. All rights reserved.
//

import UIKit

class MainCoordinator: Coordinator {
    
    var onSuccessFlow: ((MainCoordinator?) -> ())?
    
    private let mainTabbar = MainController()
    private let appSettings: AppSettings
    
    init(window: UIWindow, appSettings: AppSettings) {
        self.appSettings = appSettings
        super.init(window: window)
    }
    
    override func startFlow() {
        
        // создадим кучу координаторов для каждого табика
        //MARK: - coordinator 1
        let lessonsCoordinator = LessonsCoordinator(window: self.window)
        addChildrenCoordinator(coordinator: lessonsCoordinator)
        
        //MARK: - coordinator 2
        let myLessonsCoordinator = MyLessonsCoordinator(window: self.window)
        addChildrenCoordinator(coordinator: myLessonsCoordinator)
        
        //MARK: - coordinator 3
        let kuponsCoordinator = KuponsCoordinator(window: self.window)
        addChildrenCoordinator(coordinator: kuponsCoordinator)
        
        //MARK: - coordinator 4 + alert
        let settingsCoordinator = SettingsCoordinator(window: self.window, appSettings: appSettings)
        settingsCoordinator.onLogout = { [weak self] in
            let alert = UIAlertController(title: "Вы точно хотите выйти?", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Да", style: .destructive, handler: { [weak self] _ in
                self?.onSuccessFlow?(self)
            }))
            alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
            self?.window.rootViewController?.present(alert, animated: true, completion: nil)
        }
        addChildrenCoordinator(coordinator: settingsCoordinator)
        
        //MARK: -
        lessonsCoordinator.startFlow()
        myLessonsCoordinator.startFlow()
        kuponsCoordinator.startFlow()
        settingsCoordinator.startFlow()
        
        //MARK: -
        mainTabbar.viewControllers = [lessonsCoordinator.rootController,
                                      myLessonsCoordinator.rootController,
                                      kuponsCoordinator.rootController,
                                      settingsCoordinator.rootController]
        window.rootViewController = mainTabbar
    }
    
}
