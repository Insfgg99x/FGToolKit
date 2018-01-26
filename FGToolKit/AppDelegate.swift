//
//  AppDelegate.swift
//  FGToolKit
//
//  Created by xgf on 2018/1/26.
//  Copyright © 2018年 xgf. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let navi = UINavigationController.init(rootViewController: ViewController())
        navi.navigationBar.tintColor = .black
        window?.rootViewController = navi
        return true
    }

}

