//
//  Coordinator.swift
//  URLSession
//
//  Created by Roman Berezin on 09.09.2020.
//  Copyright © 2020 Roman Berezin. All rights reserved.
//

import UIKit

class Coordinator: CoordinatorProtocol {
    
    var window: UIWindow
    
    private var childrenCoordinators: [Coordinator] = []
    
    init(window: UIWindow) {
        self.window = window
    }
    
    deinit {
        print("deinit \(self)")
    }
    
    func startFlow() {
        //
    }
    
    func addChildrenCoordinator(coordinator: Coordinator?) {
        if
            let coordinator = coordinator,
            childrenCoordinators.firstIndex(where: { (element) -> Bool in
                return element === coordinator
            }) == nil
        {
            childrenCoordinators.append(coordinator)
        }
    }
    
    func removeChildrenCoordinator(coordinator: Coordinator?) {
        if let index = childrenCoordinators.firstIndex(where: { (element) -> Bool in
            return element === coordinator
        })  {
            childrenCoordinators.remove(at: index)
        }
    }
}
