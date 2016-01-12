//
//  DiscoverViewController.swift
//  Dice Up
//
//  Created by Can Akyurek on 12/01/16.
//  Copyright © 2016 Can Akyurek. All rights reserved.
//

import UIKit

class DiscoverViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let nameInfo = ["Ali", "Emre", "Mert", "Salih", "Haluk"]
    let bioInfo = ["Dansçıya, sporcuya, anneciya, babacıya.. Dolciyaa. Dolciyaa. Dolciyaa, dolciyaa",
                    "Eyüp Sabri Tuncer limon kolonyaları",
                    "Şirinoğlu Faktoring Hizmetleri",
                    "God bless you please, Mrs Robinson",
                    "Haydi yine gel benim oool .."]
    
    let identifier = "Cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension DiscoverViewController: UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameInfo.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(identifier) as! DiscoverCell
        
        cell.userPhoto.image = UIImage(named: "placeholderImage.jpg")
        cell.userName.text = nameInfo[indexPath.row]
        cell.userBio.text = bioInfo[indexPath.row]
        
        return cell
    }
}
