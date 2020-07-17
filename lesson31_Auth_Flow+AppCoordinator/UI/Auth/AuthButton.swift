//
//  AuthButton.swift
//  lesson31_Auth_Flow+AppCoordinator
//
//  Created by Roman Berezin on 15.07.2020.
//  Copyright © 2020 Bosov. All rights reserved.
//

import UIKit

class AuthButton: UIButton {
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //self.layer.borderWidth = 1
        self.layer.cornerRadius = 11.3
        self.backgroundColor = UIColor(red: 24/255, green: 105/255, blue: 132/255, alpha: 1)
    }
}
