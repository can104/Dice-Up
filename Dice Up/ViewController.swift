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
    
    // Properties
    let permissions = ["public_profile", "user_friends"]
    var alert: UIAlertController!
    var modelUser: User!
    var pictureView: FBSDKProfilePictureView!

    // MARK: Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         if (PFUser.currentUser() != nil || FBSDKAccessToken.currentAccessToken() != nil) {
            
            // If logging in is successful, get Facebook profile information
            getFacebookInfo()
            
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        // No user is logged in
        if (PFUser.currentUser() == nil || FBSDKAccessToken.currentAccessToken() == nil) {
            
            // Show Login Screen from ParseUI
            presentLoginScreen()
            
        }
    }
    // Here comes the login screen with just a few lines of code
    
    func presentLoginScreen() {
        let loginViewController = PFLogInViewController()
        loginViewController
        loginViewController.facebookPermissions = permissions
        loginViewController.delegate = self
        loginViewController.fields = [.UsernameAndPassword, .LogInButton, .PasswordForgotten, .SignUpButton, .Facebook]
        loginViewController.emailAsUsername = true
        loginViewController.signUpController?.delegate = self
        
        self.presentViewController(loginViewController, animated: false, completion: nil)
    }
    
    // Get Facebook Profile information by Graph API
    
    func getFacebookInfo() {
        let fbRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, first_name, last_name"])
        
        fbRequest.startWithCompletionHandler {(connection, result, error) -> Void in
            
            // Obtain the result as NSDictionary
            if let fbData = result as? NSDictionary {
                
                // Assign the dictionary values to model properties
                self.modelUser = User(JSON: fbData)
                
                // Assign Facebook profile picture 
                
                self.getProfilePicture(profileId: self.modelUser.profileId)
                
            } else {
                print(error.localizedDescription)
            }
        }
    }

    // Get Facebook Profile Picture and place it on the screen
    
    func getProfilePicture(profileId id: String) {
        pictureView = FBSDKProfilePictureView(frame: CGRect(x: self.view.bounds.width/2 - 50, y: 50, width: 100, height: 100))
        pictureView.profileID = id
        pictureView.pictureMode = .Square
        
        view.addSubview(pictureView)
        
        UIGraphicsBeginImageContextWithOptions(pictureView.bounds.size, true, 0)
        pictureView.drawViewHierarchyInRect(pictureView.bounds, afterScreenUpdates: true)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
    }
}

// MARK: PFLogin and PFSignup Delegate methods

extension ViewController: PFLogInViewControllerDelegate {
    
    func logInViewController(logInController: PFLogInViewController, didLogInUser user: PFUser) {
        self.dismissViewControllerAnimated(true, completion: nil)
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
    }
}
