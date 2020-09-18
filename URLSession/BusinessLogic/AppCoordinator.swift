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
    
    override func startFlow() {
        startCheckInternetFlow()
    }
    
    private func startCheckInternetFlow() {
        let checkInternetCoordinator = CheckInternetFlowCoordinator(window: window)
        checkInternetCoordinator.onSuccessFlow = { [weak self] coordinator in
            self?.removeChildrenCoordinator(coordinator: coordinator)
            self?.startMainFlow()
        }
        addChildrenCoordinator(coordinator: checkInternetCoordinator)
        checkInternetCoordinator.startFlow()
    }
    
    private func startMainFlow() {
        let mainFlowCoordinator = MainFlowCoordinator(window: window)
        mainFlowCoordinator.onSuccessFlow = { [weak self] coordinator in
            self?.removeChildrenCoordinator(coordinator: coordinator)
            self?.startFlow()
        }
        self.addChildrenCoordinator(coordinator: mainFlowCoordinator)
        mainFlowCoordinator.startFlow()
    }
    
}
