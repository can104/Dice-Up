//
//  File.swift
//  Dice Up
//
//  Created by Can Akyurek on 08/02/16.
//  Copyright © 2016 Can Akyurek. All rights reserved.
//

import UIKit

extension UIView {
    
    func roundImageView() {
        
        let width = bounds.width < bounds.height ? bounds.width : bounds.height
        let mask = CAShapeLayer()
        mask.path = UIBezierPath(ovalInRect: CGRectMake(bounds.midX - width / 2, bounds.midY - width / 2, width, width)).CGPath
        
        self.layer.mask = mask
    }
}