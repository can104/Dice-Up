//
//  User.swift
//  Dice Up
//
//  Created by Can Akyurek on 12/01/16.
//  Copyright © 2016 Can Akyurek. All rights reserved.
//

import Foundation

class User {
    
    var name: String
    var email: String?
    
    init(JSON: NSDictionary) {
        
        name = JSON["name"] as! String
        email = JSON["email"] as? String
    }
}