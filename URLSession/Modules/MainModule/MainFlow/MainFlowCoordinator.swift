//
//  MainFlowCoordinator.swift
//  URLSession
//
//  Created by Roman Berezin on 08.09.2020.
//  Copyright © 2020 Roman Berezin. All rights reserved.
//

import UIKit

class MainFlowCoordinator: Coordinator {
    
    var onSuccessFlow: ((MainFlowCoordinator?) -> ())?
    private let rootViewController = NavigationController()
    
    override func startFlow() {
        startMainFlow()
    }
    
    private func startMainFlow() {
        let controller = MainController()
        controller.mainView.onFetchPressed = { [weak self] in
            self?.startFetchFlow()
        }
        rootViewController.viewControllers = [controller]
        window.rootViewController = rootViewController
    }
    
    private func startFetchFlow() {
        let userListFlowCoordinator = UserListFlowCoordinator(window: window)
        userListFlowCoordinator.onSuccessFlow = { [weak self] coordinator in
            self?.removeChildrenCoordinator(coordinator: coordinator)
                //self?.startFlow()
        }
        self.addChildrenCoordinator(coordinator: userListFlowCoordinator)
        userListFlowCoordinator.startFlow()
    }
}
