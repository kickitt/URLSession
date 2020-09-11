//
//  CheckInternetFlowCoordinator.swift
//  URLSession
//
//  Created by Yurii Bosov on 11.09.2020.
//  Copyright © 2020 Roman Berezin. All rights reserved.
//

import Foundation

class CheckInternetFlowCoordinator: Coordinator {
    
    var onSuccessFlow: ((Coordinator?)->())?
    
    override func startFlow() {
        let viewModel = CheckInternetViewModel()
        let controller = R.storyboard.checkInternet.checkInternetVC()!
        
        controller.viewModel = viewModel
        controller.onCheckInternetSuccess = { [weak self] in
            self?.onSuccessFlow?(self)
        }
        window.rootViewController = controller
    }
    
}
