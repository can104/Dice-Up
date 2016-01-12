//
//  DiscoverCell.swift
//  Dice Up
//
//  Created by Can Akyurek on 13/01/16.
//  Copyright © 2016 Can Akyurek. All rights reserved.
//

import UIKit

class DiscoverCell: UITableViewCell {

    
    @IBOutlet weak var userPhoto: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userBio: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
