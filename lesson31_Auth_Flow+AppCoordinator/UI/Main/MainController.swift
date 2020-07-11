//
//  MainController.swift
//  lesson31_Auth_Flow
//
//  Created by Yurii Bosov on 10.07.2020.
//  Copyright © 2020 Bosov. All rights reserved.
//

import UIKit

class MainController: BaseViewController {

    var onLogout: ((MainController)->())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Main"
    }
    
    @IBAction private func logoutButtonClicked() {
        
        let alert = UIAlertController(title: "Вы точно хотите выйти?", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Да", style: .destructive, handler: { [weak self] _ in
            if let strongSelf = self {
                self?.onLogout?(strongSelf)
            }
        }))
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
}
