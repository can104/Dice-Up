//
//  MessageViewCell.swift
//  Dice Up
//
//  Created by Can Akyurek on 07/02/16.
//  Copyright © 2016 Can Akyurek. All rights reserved.
//

import UIKit

class MessageViewCell: UITableViewCell {
    
    @IBOutlet weak var messageImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    override func layoutSubviews() {

        messageImageView.roundImageView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
       
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
