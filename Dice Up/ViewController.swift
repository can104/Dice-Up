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
import ParseUI
import Parse
import ParseFacebookUtilsV4
import Firebase

class ViewController: UIViewController {
    
    // Properties
    let permissions = ["public_profile", "user_friends"]
    var pictureView: FBSDKProfilePictureView!
    
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
    // Here comes the login screen with just a few lines of code
    
    func presentLoginScreen() {
        
        let loginViewController = PFLogInViewController()
        loginViewController.facebookPermissions = permissions
        loginViewController.delegate = self
        loginViewController.fields = [.UsernameAndPassword, .LogInButton, .PasswordForgotten, .SignUpButton, .Facebook]
        loginViewController.emailAsUsername = true
        loginViewController.signUpController?.delegate = self
        
        self.presentViewController(loginViewController, animated: false, completion: nil)
    }

    // Get Facebook Profile Picture and place it on the screen
    
//    func getProfilePicture(profileId id: String) {
//        pictureView = FBSDKProfilePictureView(frame: CGRect(x: self.view.bounds.width/2 - 50, y: 50, width: 100, height: 100))
//        pictureView.profileID = id
//        pictureView.pictureMode = .Square
//        
//        view.addSubview(pictureView)
//        
//        UIGraphicsBeginImageContextWithOptions(pictureView.bounds.size, true, 0)
//        pictureView.drawViewHierarchyInRect(pictureView.bounds, afterScreenUpdates: true)
//        let image = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//    }
}

// MARK: PFLogin and PFSignup Delegate methods

extension ViewController: PFLogInViewControllerDelegate {
    
    func logInViewController(logInController: PFLogInViewController, didLogInUser user: PFUser) {

        dismissViewControllerAnimated(true, completion: nil)
    }
}

extension ViewController: PFSignUpViewControllerDelegate {
    
    func signUpViewController(signUpController: PFSignUpViewController, didSignUpUser user: PFUser) {

        
        Utils.showMessage(self, title: "Welcome!", message: "You have successfully signed up")
    }
}
