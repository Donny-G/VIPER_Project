//
//  AppDelegate.swift
//  VIPER_Project
//
//  Created by Denis Golovizin on 22.07.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    func application(_ application: UIApplication, didFinishLaunchingWithOptions
                    launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
=======
  //  var window: UIWindow?
=======
    var window: UIWindow?
>>>>>>> 7b08c27... 2-Main-screen: update code style + corrections in VC

=======
>>>>>>> 4f822a7... 2-Main-screen: delete storyboard, set SceneDelegate, update MainViewController
    func application(_ application: UIApplication, didFinishLaunchingWithOptions
                     launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
>>>>>>> 050eb53... 2-Main-screen: corrections of VIPER architecture + Network Class
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting
                     connectingSceneSession: UISceneSession,
                     options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running,
        // this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

}
