//
//  AppDelegate.swift
//  DataModel
//
//  Created by Andrea on 29/05/2019.
//  Copyright © 2019 Andrea. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        do{
            let _ = try Realm()
        } catch {
            print("Error initializing realm: \(error)")
        }
        
        return true
    }
    
}
