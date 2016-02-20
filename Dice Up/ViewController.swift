//
//  ViewController.swift
//  Dice Up
//
//  Created by Can Akyurek on 12/01/16.
//  Copyright © 2016 Can Akyurek. All rights reserved.
//

// This view controller is responsible for checking user status
// It decides whether login or signup screens should be presented
// If not necessary, it presents the tab bar view controller.
// At least, it is what it is wanted.

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit
import Firebase

class ViewController: UIViewController {

    // MARK: Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if FBSDKAccessToken.currentAccessToken() != nil {

            let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
            let tabBarController = storyboard.instantiateViewControllerWithIdentifier("TabBar") as! UITabBarController
            
            presentViewController(tabBarController, animated: false, completion: nil)
            
        } else {
            
            let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
            let loginViewController = storyboard.instantiateViewControllerWithIdentifier("Signup") as! AuthViewController
            
            presentViewController(loginViewController, animated: true, completion: nil)
        }
        
    }
    

        
        
        
    
}

