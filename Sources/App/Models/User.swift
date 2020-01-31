//
//  User.swift
//  
//
//  Created by Daniel Hjärtström on 2020-01-29.
//

import Vapor

final class User: Content {

    let email: String
    let uid: String
    
    init(email: String, uid: String) {
        self.email = email
        self.uid = uid
    }
    
}
