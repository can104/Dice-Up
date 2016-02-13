//
//  CollectionViewCell.swift
//  Dice Up
//
//  Created by Can Akyurek on 05/02/16.
//  Copyright © 2016 Can Akyurek. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    
    override func layoutSubviews() {
        imageView.roundImageView()
    }
}
