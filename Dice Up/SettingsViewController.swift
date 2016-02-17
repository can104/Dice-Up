//
//  SettingsViewController.swift
//  Dice Up
//
//  Created by Can Akyurek on 07/02/16.
//  Copyright © 2016 Can Akyurek. All rights reserved.
//

import UIKit
import Parse
import ParseFacebookUtilsV4

class SettingsViewController: UITableViewController {

    @IBOutlet weak var logoutCell: UITableViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if tableView.cellForRowAtIndexPath(indexPath) == logoutCell {
                
            PFUser.logOutInBackgroundWithBlock({ [unowned self] error in
                    
                let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
                let vc = storyboard.instantiateViewControllerWithIdentifier("FirstScreen") as! ViewController
                self.presentViewController(vc, animated: true, completion: nil)
                })
            }
    }
}
