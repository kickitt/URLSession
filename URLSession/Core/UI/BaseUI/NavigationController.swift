//
//  NavController.swift
//  URLSession
//
//  Created by Roman Berezin on 08.09.2020.
//  Copyright © 2020 Roman Berezin. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {

    deinit {
        print("deinit \(self.className)")
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return topViewController?.supportedInterfaceOrientations ?? .all
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return topViewController?.preferredStatusBarStyle ?? .lightContent
    }
}
