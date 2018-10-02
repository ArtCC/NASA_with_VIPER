//
//  AppDelegate.swift
//  NASA-with-VIPER
//
//  Created by Arturo Carretero Calvo on 13/9/18.
//  Copyright © 2018 Arturo Carretero Calvo. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    // MARK: - Properties
    
    var window: UIWindow?

    // MARK: - Functions
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Init instance for module
        // Crear instancia para el primer módulo que se carga
        let list = ListWireFrame.createListModule()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = list
        window?.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }
}
