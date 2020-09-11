//
//  UserListFlowCoordinator.swift
//  URLSession
//
//  Created by Roman Berezin on 08.09.2020.
//  Copyright © 2020 Roman Berezin. All rights reserved.
//

import UIKit
import Rswift

class UserListFlowCoordinator: Coordinator {
 
    var onSuccessFlow: ((UserListFlowCoordinator?)->())?
    var onFailureFlow: ((UserListFlowCoordinator?)->())?
    private let rootViewController = NavigationController()
    
    override init(window: UIWindow) {
        super.init(window: window)
        self.window = window
    }
    
    override func startFlow() {
        self.startUserListFlow()
    }
    
    private func startUserListFlow() {
        let controller = UserListController(viewModel: UserListViewModel())
        let navController = NavigationController.init(rootViewController: controller)
        window.rootViewController = navController
    }
}
