//
//  AppCoordinator.swift
//  URLSession
//
//  Created by Roman Berezin on 07.09.2020.
//  Copyright © 2020 Roman Berezin. All rights reserved.
//

import UIKit
import Rswift

class AppCoordinator: CoordinatorProtocol {
    
    let window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        let controller = MainController()
        let navController = NavigationController.init(rootViewController: controller)
        window?.rootViewController = navController
    }
    
}
