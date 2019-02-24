//
//  AppDelegate.swift
//  prototype1scrollTableView
//
//  Created by Markus Flicker on 09.12.18.
//  Copyright © 2018 Worldcare. All rights reserved.
//

import UIKit
import Firestore
import Firebase


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        
        let authListener = Auth.auth().addStateDidChangeListener { (auth, user) in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            if user != nil {
                let controller = storyboard.instantiateViewController(withIdentifier: "tabBar") as! UITabBarController
                self.window?.rootViewController = controller
                self.window?.makeKeyAndVisible()
            } else {
                let controller = storyboard.instantiateViewController(withIdentifier: "homeVC") as! HomeViewController
                self.window?.rootViewController = controller
                self.window?.makeKeyAndVisible()
            }
        }
        
        GADMobileAds.configure(withApplicationID: "ca-app-pub-8326376367560561~6309227404")
        
        
        
        
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let navigationController = storyboard.instantiateViewController(withIdentifier: "loginNVC") as! UINavigationController
//        var rootVC: UIViewController?
//
//
//        let authListener = Auth.auth().addStateDidChangeListener { auth, user in
////            let appdelegate = UIApplication.shared.delegate as! AppDelegate
////            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//
//            if user != nil {
//
//                rootVC = storyboard.instantiateViewController(withIdentifier: "profilVC")
//
////                let nav = UINavigationController(rootViewController: rootVC)
//
////                appdelegate.window!.rootViewController = nav
//            } else {
//                rootVC = storyboard.instantiateViewController(withIdentifier: "homeVC")
//
////                let nav = UINavigationController(rootViewController: rootVC)
////                appdelegate.window!.rootViewController = nav
//
//            }
//            navigationController.pushViewController(rootVC!, animated: false)
        
//        }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

