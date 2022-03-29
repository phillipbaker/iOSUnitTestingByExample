//
//  TestingAppDelegate.swift
//  AppLaunchTests
//
//  Created by Phillip Baker on 5/6/21.
//

import UIKit

@objc(TestingAppDelegate)
class TestingAppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        print(">> Launching with testing app delegate")
        return true
    }
}
