//
//  SettingsViewController.swift
//  Dice Up
//
//  Created by Can Akyurek on 07/02/16.
//  Copyright © 2016 Can Akyurek. All rights reserved.
//

import UIKit
import Firebase
import FBSDKLoginKit

class SettingsViewController: UITableViewController {

    @IBOutlet weak var logoutCell: UITableViewCell!
    let loginManager = FBSDKLoginManager()
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if tableView.cellForRowAtIndexPath(indexPath) == logoutCell {
            
            let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
            let loginViewController = storyboard.instantiateViewControllerWithIdentifier("Signup") as! AuthViewController
            
            presentViewController(loginViewController, animated: true, completion: nil)
            
            firebaseReference.unauth()
            loginManager.logOut()
            
            }
    }
}
