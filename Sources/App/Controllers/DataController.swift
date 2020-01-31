//
//  DataController.swift
//  App
//
//  Created by Daniel Hjärtström on 2020-01-31.
//

import Vapor

final class DataController {
    
    func returnOne(_ req: Request) throws -> User {
        guard let prefix = req.query[String.self, at: "one"] else { throw Abort(.notFound) }
        
        let arr = [
            User(email:"one@gmail.com", uid:"11111111"),
            User(email:"two@gmail.com", uid:"22222222"),
            User(email:"three@gmail.com", uid:"33333333")
        ]
        
        if let user = (arr.filter { $0.email.hasPrefix(prefix) }).first {
            return user
        } else {
            throw Abort(.notFound)
        }
    }
    
    
    func all(_ req: Request) throws -> [User] {
        return [
            User(email:"one@gmail.com", uid:"11111111"),
            User(email:"two@gmail.com", uid:"22222222"),
            User(email:"three@gmail.com", uid:"33333333")
        ]
    }
    
}
