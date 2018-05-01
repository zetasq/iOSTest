//
//  AppDelegate.swift
//  iOSTest
//
//  Created by Zhu Shengqi on 28/08/2017.
//  Copyright © 2017 Zhu Shengqi. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
    let mainWindow = UIWindow(frame: UIScreen.main.bounds)
    self.window = mainWindow
    
    mainWindow.rootViewController = ContainerScrollViewController()
    mainWindow.makeKeyAndVisible()
    
    return true
  }

}

