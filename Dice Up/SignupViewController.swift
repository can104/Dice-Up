//
//  LoginViewController.swift
//  Dice Up
//
//  Created by Can Akyurek on 17/02/16.
//  Copyright © 2016 Can Akyurek. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class SignupViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var mainButton: UIButton!
    @IBOutlet weak var noteButton: UIButton!
    @IBOutlet weak var noteLabel: UILabel!
    var registered = true
    
    // If registered is true, the user already has an account. The main button offers
    // the user to login.
    
    @IBAction func facebookButtonTapped(sender: FBSDKLoginButton) {
        
    }
    
    @IBAction func noteButtonTapped(sender: UIButton) {
      
        if registered {
            mainButton.setTitle("Login", forState: .Normal)
            noteButton.setTitle("Signup", forState: .Normal)
            noteLabel.text = "Don't have an account yet?"
            
        } else {
            mainButton.setTitle("Signup", forState: .Normal)
            noteButton.setTitle("Login", forState: .Normal)
            noteLabel.text = "Already have an account?"
        }
        registered = !registered
    }
    
    @IBAction func mainButtonTapped(sender: UIButton) {
        
        if !registered {
            
            // User logged in
            
            firebaseReference.authUser(emailField.text, password: passwordField.text, withCompletionBlock: { loginError, loginData in
                
                if loginError != nil {
                    Utils.showMessage(self, title: "Error", message: loginError.localizedDescription)
                    
                } else {
                    let newUser = ["provider": loginData.provider, "email": loginData.providerData["email"] as? NSString as? String]
                    
                    firebaseReference.childByAppendingPath("users").childByAppendingPath((loginData.uid)).setValue(newUser)
                    
                    let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
                    let tabBarController = storyboard.instantiateViewControllerWithIdentifier("TabBar") as! UITabBarController
                    
                    self.presentViewController(tabBarController, animated: false, completion: nil)
                }
            })
            
        } else {
            
            // Create user
            firebaseReference.createUser(emailField.text, password: passwordField.text) { [unowned self] signupError, signupResult in
                
                if signupError != nil {
                    Utils.showMessage(self, title: "Error", message: signupError.localizedDescription)
                } else {
                    Utils.showMessage(self, title: "Welcome", message: "Your account has been created successfully")
                    
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
