//
//  SettingsController.swift
//  lesson31_Auth_Flow+AppCoordinator
//
//  Created by Yurii Bosov on 17.07.2020.
//  Copyright © 2020 Bosov. All rights reserved.
//

import UIKit
import SDWebImage

class SettingsController: BaseViewController {
    
    @IBOutlet private var userPhoto: UIImageView?
    @IBOutlet private var userName: UILabel?
    @IBOutlet private var userEmail: UILabel?
    @IBOutlet private var userPhone: UILabel?

    var user: User?
    var onLogoutClicked: (()->())?
    var onChangeClicked: (()->())?
    
    override func setupController() {
        self.title = "Settings"
        self.tabBarItem = UITabBarItem(title: "Settings",
                                       image: R.image.settingsIcon(),
                                       tag: 0)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = user?.name
        
        if let path = user?.photo {
                  userPhoto?.sd_setImage(with: URL(string: path))
              }
              
             userName?.text = user?.name
             userPhone?.text = user?.phone
             userEmail?.text = user?.email

          }

    @IBAction private func logoutButtonClicked() {
        onLogoutClicked?()
    }
    @IBAction private func changeButtonClicked() {
        onChangeClicked?()
    }
}
