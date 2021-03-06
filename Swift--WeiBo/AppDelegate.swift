//
//  AppDelegate.swift
//  Swift--WeiBo
//
//  Created by YinMingpu on 16/7/4.
//  Copyright © 2016年 Mingpu. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    //window是可选类型
    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        print(self)
        
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        /*
          self.window?: 可选连的表示方法，如果window为nil，可选连失效，支局代码不会继续执行，从而避免崩溃
         self.window！: 强制拆包，如果拆出来是空会继续执行，可能会造成崩溃
        */
        self.window?.rootViewController = MainViewController()
        
        self.window?.makeKeyAndVisible()
        
        //全局修改NavigationBar
        UINavigationBar.appearance().tintColor = UIColor.orangeColor()
        
        UITabBar.appearance().tintColor = UIColor.orangeColor()
        
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

