//
//  MessageViewController.swift
//  Dice Up
//
//  Created by Can Akyurek on 07/02/16.
//  Copyright © 2016 Can Akyurek. All rights reserved.
//

import UIKit

class MessageViewController: UIViewController {

    let cellIdentifier = "MessageCell"
    var username: String!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "Text" {
            let textViewController = segue.destinationViewController as! TextViewController
            
            let indexPath = tableView.indexPathForSelectedRow
            textViewController.textTo = titles[indexPath!.row]

        }
    }
}

extension MessageViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! MessageViewCell
        cell.nameLabel.text = titles[indexPath.row]
        username = titles[indexPath.row]
        cell.detailLabel.text = details[indexPath.row]
        cell.messageImageView.image = carImages[indexPath.row]

        return cell
    }
}

