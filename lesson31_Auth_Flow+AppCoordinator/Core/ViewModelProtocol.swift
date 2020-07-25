//
//  ViewModelProtocol.swift
//  lesson31_Auth_Flow+AppCoordinator
//
//  Created by Nataliia Storozheva on 25.07.2020.
//  Copyright © 2020 Bosov. All rights reserved.
//

import UIKit

protocol ViewModelProtocol {
    var onLoading: (()->())? { get set }
    var onLoadedSuccess: ((Any)->())? { get set }
    var onLoadedFailed: ((String)->())? { get set }
}
