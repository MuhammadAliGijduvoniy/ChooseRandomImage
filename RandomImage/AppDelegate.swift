//
//  AppDelegate.swift
//  RandomImage
//
//  Created by MuhammadAli on 29/11/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame:UIScreen.main.bounds)
        window?.rootViewController = MainVC_2()
        window?.makeKeyAndVisible()
        
        return true
    }

  
}

