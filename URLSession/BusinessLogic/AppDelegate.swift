//
//  AppDelegate.swift
//  URLSession
//
//  Created by Roman Berezin on 07.09.2020.
//  Copyright © 2020 Roman Berezin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var appCoordinator: AppCoordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        let appCoordinator = AppCoordinator(window: window)
        self.window = window
        self.appCoordinator = appCoordinator
        appCoordinator.startFlow()
        window.makeKeyAndVisible()
        
        return true
    }
}

