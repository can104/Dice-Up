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
    
    override func layoutSubviews() {
        imageView.layer.cornerRadius = imageView.bounds.height / 2
        imageView.clipsToBounds = true
    }
}
