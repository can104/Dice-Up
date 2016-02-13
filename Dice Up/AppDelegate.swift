//
//  AppDelegate.swift
//  Dice Up
//
//  Created by Can Akyurek on 12/01/16.
//  Copyright © 2016 Can Akyurek. All rights reserved.
//

import UIKit
import Parse
import ParseUI
import FBSDKCoreKit
import ParseFacebookUtilsV4
import Firebase

var firebaseReference = Firebase(url: "https://dice-up.firebaseio.com/")

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        
        // Override point for customization after application launch.
        
        Parse.enableLocalDatastore()
        Parse.setApplicationId("mf6JHQQj6dJ17U4YHbxqSpe6d7utmRMVjlRBGHv1", clientKey: "Tk5VXTomnH2ilX4C2yMXFeyyN4jpcLYbSX2HhQM1")
        PFFacebookUtils.initializeFacebookWithApplicationLaunchOptions(launchOptions)
        
        return true
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        
        FBSDKAppEvents.activateApp()
    }

    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        
        return FBSDKApplicationDelegate.sharedInstance().application(application, openURL: url, sourceApplication: sourceApplication, annotation: annotation)
    }
}

