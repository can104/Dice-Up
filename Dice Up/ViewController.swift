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
    
    @IBOutlet weak var nameTextField: UITextField!
    
    // Properties
    let permissions = ["public_profile", "user_friends"]
    var alert: UIAlertController!
    var user: User!
    var pictureView: FBSDKProfilePictureView!

    // MARK: Lifecycle methods

    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        // No user is logged in
        if (PFUser.currentUser() == nil || FBSDKAccessToken.currentAccessToken() == nil) {
            
            // Show Login Screen from ParseUI
            presentLoginScreen()
            
        } else {
            getFacebookInfo()
        }
    }
    
    
    
    // Here comes the login screen with just a few lines of code
    func getFacebookInfo() {
        let fbRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, first_name, last_name"])
        
        fbRequest.startWithCompletionHandler {(connection, result, error) -> Void in
            
            // Obtain the result as NSDictionary
            if let fbData = result as? NSDictionary {
                
                // Assign the dictionary values to model properties
                self.user = User(JSON: fbData)
                
                self.nameTextField.text = "\(self.user.name) \(self.user.surname)"
                
                if self.nameTextField.text != nil {
                    self.nameTextField.userInteractionEnabled = false
                }
                
                self.getProfilePicture(profileId: self.user.profileId)
                
            } else {
                print(error.localizedDescription)
            }
        }
    }
    
    func getProfilePicture(profileId id: String) {
        pictureView = FBSDKProfilePictureView(frame: CGRect(x: self.view.bounds.width/2 - 50, y: 50, width: 100, height: 100))
        
        pictureView.profileID = id
        pictureView.pictureMode = .Square
        
        view.addSubview(pictureView)
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
