//
//  User.swift
//  Dice Up
//
//  Created by Can Akyurek on 12/01/16.
//  Copyright © 2016 Can Akyurek. All rights reserved.
//

import Foundation

class User {
    
    var profileId: String
    var name: String
    var surname: String
    var email: String?
    
    init(JSON: NSDictionary) {
        
        profileId = JSON["id"] as! String
        name = JSON["first_name"] as! String
        surname = JSON["last_name"] as! String
        email = JSON["email"] as? String
    }
}