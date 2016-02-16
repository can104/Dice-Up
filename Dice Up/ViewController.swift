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
    
    // Properties
    let permissions = ["public_profile", "user_friends"]
    var pictureView: FBSDKProfilePictureView!
    let loginManager = FBSDKLoginManager()
    
    // MARK: Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        firebaseReference.createUser("anan@anan.anan", password: "12345678") { (error, result) -> Void in
            if error == nil {
                if let uid = result["uid"] as? String {
                    print(uid)
                }
            }
        }
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if FBSDKAccessToken.currentAccessToken() != nil {

            let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
            let tabBarController = storyboard.instantiateViewControllerWithIdentifier("TabBar") as! UITabBarController
            
            presentViewController(tabBarController, animated: false, completion: nil)
            
        } else {
            presentLoginScreen()
        }
        
    }
    
    func presentLoginScreen() {
        
        loginManager.logInWithReadPermissions(permissions, fromViewController: self) { result, error in
            let accessToken = FBSDKAccessToken.currentAccessToken().tokenString
            
            firebaseReference.authWithOAuthProvider("facebook", token: accessToken, withCompletionBlock: { (error, data) -> Void in
                if error != nil {
                    print("Hello! The data is \(data.uid)")
                }
            })
        }
    }
}

