//
//  ProfileViewController.swift
//  Dice Up
//
//  Created by Can Akyurek on 12/01/16.
//  Copyright © 2016 Can Akyurek. All rights reserved.
//

import UIKit
import Parse
import ParseFacebookUtilsV4
import ParseUI

class ProfileViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Sign out", style: .Plain, target: self, action: "signoutTapped")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Message", style: .Plain, target: self, action: "messageTapped")
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func messageTapped() {
        print("message button tapped")
    }

    func signoutTapped() {
        PFUser.logOutInBackgroundWithBlock { (error) -> Void in
            if error == nil {
                
                
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
