//
//  UIImage+NoString.swift
//  Dice Up
//
//  Created by Can Akyurek on 08/02/16.
//  Copyright © 2016 Can Akyurek. All rights reserved.
//

import UIKit

extension UIImage {
    
    enum AssetIdentifier: String {
        case car1, car2, car3, car4, car5, car6, car7, car8, car9, car10, placeholderImage
    }
    
    convenience init!(assetIdentifier: AssetIdentifier) {
        self.init(named: assetIdentifier.rawValue)
    }
}
