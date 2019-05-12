//
//  AppDelegate.swift
//  ExampleiOS
//
//  Created by Haider Khan on 5/11/19.
//  Copyright © 2019 Figure. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    lazy var window: UIWindow? = {
        let window = UIWindow(frame: UIScreen.main.bounds)
        return window
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()
        return true
    }


}

