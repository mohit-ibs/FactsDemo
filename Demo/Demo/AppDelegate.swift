//
//  AppDelegate.swift
//  Demo
//
//  Created by Mohit Gupta on 23/09/20.
//  Copyright © 2020 Mohit Gupta. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    lazy var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let homeViewController = ViewController()
        let nav = UINavigationController(rootViewController: homeViewController)        
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        return true
    }
}

