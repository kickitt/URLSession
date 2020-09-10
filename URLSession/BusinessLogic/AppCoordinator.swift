//
//  AppCoordinator.swift
//  URLSession
//
//  Created by Roman Berezin on 07.09.2020.
//  Copyright © 2020 Roman Berezin. All rights reserved.
//

import UIKit
import Rswift

class AppCoordinator: Coordinator {
    
    override init(window: UIWindow) {
        super.init(window: window)
        self.window = window
    }
    
    override func startFlow() {
        startMainFlow()
    }
    
    private func startMainFlow() {
        let mainFlowCoordinator = MainFlowCoordinator(window: window)
        mainFlowCoordinator.onSuccessFlow = { [weak self] coordinator in
            self?.removeChildrenCoordinator(coordinator: mainFlowCoordinator)
            self?.startFlow()
        }
        self.addChildrenCoordinator(coordinator: mainFlowCoordinator)
        mainFlowCoordinator.startFlow()
    }
    
}
