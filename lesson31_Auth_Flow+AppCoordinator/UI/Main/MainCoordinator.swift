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
    
    override func startFlow() {
        
        // создадим кучу координаторов для каждого табика
        //1
        let lessonsCoordinator = LessonsCoordinator(window: self.window)
        addChildrenCoordinator(coordinator: lessonsCoordinator)
        
        //2
        
        //3
        
        //4
        let settingsCoordinator = SettingsCoordinator(window: self.window)
        settingsCoordinator.onLogout = { [weak self] in
            let alert = UIAlertController(title: "Вы точно хотите выйти?", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Да", style: .destructive, handler: { [weak self] _ in
                self?.onSuccessFlow?(self)
            }))
            alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
            self?.window.rootViewController?.present(alert, animated: true, completion: nil)
        }
        addChildrenCoordinator(coordinator: settingsCoordinator)
        
        //
        lessonsCoordinator.startFlow()
        settingsCoordinator.startFlow()
        
        //
        mainTabbar.viewControllers = [lessonsCoordinator.rootController,
                                      settingsCoordinator.rootController]
        window.rootViewController = mainTabbar
    }
    
}
