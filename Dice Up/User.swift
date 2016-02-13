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
    
    init(name: String, surname: String, email: String?, profileId: String) {
        self.name = name
        self.surname = surname
        self.email = email
        self.profileId = profileId
    }
    
    convenience init(JSON: NSDictionary) {
        
        let profileId = JSON["id"] as? String
        let name = JSON["first_name"] as? String
        let surname = JSON["last_name"] as? String
        let email = JSON["email"] as? String
        
        self.init(name: name!, surname: surname!, email: email, profileId: profileId!)
    }
    
    
}