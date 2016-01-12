//
//  ViewController.swift
//  Dice Up
//
//  Created by Can Akyurek on 12/01/16.
//  Copyright © 2016 Can Akyurek. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit
import ParseUI
import Parse
import ParseFacebookUtilsV4

class ViewController: UIViewController {
    
    let permissions = ["public_profile", "user_friends"]
    var alert: UIAlertController!
    var user: User!
    
    // MARK: Lifecycle methods
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if (PFUser.currentUser() == nil) { // No user is logged in
            presentLoginScreen() // Show Login Screen from ParseUI
            
        } else {
            print("Logged in")
            getFacebookInfo()
        }
    }
    
    // Here comes the login screen with just a few lines of code
    
    func getFacebookInfo() {
        let fbRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields":"id,name"])
        
        fbRequest.startWithCompletionHandler { [unowned self] (connection, result, error) -> Void in
            if error == nil && result != nil {
                
                let data = result as! NSDictionary
                self.user = User(JSON: data)
                
                print(self.user.name)
            } else {
                print(error.localizedDescription)
            }
        }
    }
    
    func presentLoginScreen() {
        let loginViewController = PFLogInViewController()
        
        loginViewController.facebookPermissions = permissions
        loginViewController.delegate = self
        loginViewController.fields = [.UsernameAndPassword, .LogInButton, .PasswordForgotten, .SignUpButton, .Facebook]
        loginViewController.emailAsUsername = true
        loginViewController.signUpController?.delegate = self
        
        self.presentViewController(loginViewController, animated: false, completion: nil)
    }
}

// MARK: PFLogin and PFSignup Delegate methods

extension ViewController: PFLogInViewControllerDelegate {
    
    func logInViewController(logInController: PFLogInViewController, didLogInUser user: PFUser) {
        self.dismissViewControllerAnimated(true, completion: nil)
        // Logged in
    }
}

extension ViewController: PFSignUpViewControllerDelegate {
    
    func signUpViewController(signUpController: PFSignUpViewController, didSignUpUser user: PFUser) {
        self.dismissViewControllerAnimated(true) { [unowned self] _ in
            self.alert = UIAlertController(title: "Welcome!", message: "You have successfully signed up.", preferredStyle: .Alert)
            
            self.alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { action -> Void in
                self.dismissViewControllerAnimated(true, completion: nil)
            }))
            
            self.presentViewController(self.alert, animated: true, completion: nil)
        }
        // Signed up
        
        
    }
}
