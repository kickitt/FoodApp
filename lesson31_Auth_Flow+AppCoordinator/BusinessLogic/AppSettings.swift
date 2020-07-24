//
//  AppSettings.swift
//  lesson31_Auth_Flow
//
//  Created by Yurii Bosov on 10.07.2020.
//  Copyright © 2020 Bosov. All rights reserved.
//

import Foundation

class AppSettings {
    
    private var user: User?
    
    private enum Key {
        static let IsShowedTutorialKey = "IsShowedTutorialKey"
        static let UserLoggedKey = "UserLoggedKey"
        static let UserReggedKey = "UserReggedKey"
    }
    
    init() {
        if let data = UserDefaults.standard.object(forKey: Key.UserLoggedKey) as? Data,
            let user = try? JSONDecoder().decode(User.self, from: data) {
            self.user = user
        }
    }
    
    var currentUser: User? {
        get {
            return user
        }
    }
    
    var isShowedTutorial: Bool {
        get {
            return UserDefaults.standard.bool(forKey: Key.IsShowedTutorialKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Key.IsShowedTutorialKey)
        }
    }
    
    var isUserLogged: Bool {
        return user != nil
    }
    
    func loginUser(_ user: User) {
        self.user = user
        if let data = try? JSONEncoder().encode(user) {
            UserDefaults.standard.set(data, forKey: Key.UserLoggedKey)
        }
    }
    
    func logoutUser() {
        self.user = nil
        UserDefaults.standard.removeObject(forKey: Key.UserLoggedKey)
    }
    
    func updateUser() {
        
    }
}
